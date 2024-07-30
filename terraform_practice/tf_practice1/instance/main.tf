module "network" {
  source = "../vpc"

  NETWORK_NAME = "custom-vpc-via-tf"
  SUB_NAME     = "custom-subntw-via-tf"
}

module "disk" {
  source = "../compute_disk"
}

resource "google_compute_instance" "compute_instance" {
  name                      = var.INSTANCE_NAME
  zone                      = var.INSTANCE_ZONE
  machine_type              = var.INSTANCE_MACHINE_TYPE
  allow_stopping_for_update = var.INSTANCE_ALLOW_STOP_FOR_UPDATE
  tags                      = var.TARGET_TAGS

  network_interface {
    network    = module.network.network_id
    subnetwork = module.network.sub_network_id

    access_config {

    }
  }

  boot_disk {
    initialize_params {
      size  = var.BOOT_DISK_SIZE
      image = var.BOOT_DISK_IMAGE
    }
    auto_delete = var.BOOT_DISK_AD
  }

  service_account {
    email  = var.SERVICE_ACCOUNT_EMAIL
    scopes = var.SA_SCOPES
  }

  metadata = {
    "ssh-keys" = <<EOT
      jenkinsUser4:${file("key-file.txt")}
     EOT
  }

  metadata_startup_script = <<-EDT
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install -y openjdk-17-jdk
    sudo apt-get install -y wget
    sudo apt-get install -y git

#    sudo bash -c 'echo "Hello, World! This is a terraform managed GCP instance" > /var/www/html/index.html'
  EDT

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

data "google_client_openid_userinfo" "me" {
}

resource "google_os_login_ssh_public_key" "default" {
  user = data.google_client_openid_userinfo.me.email
  key  = file("id_rsa.pub") # path/to/ssl/id_rsa.pub
}

resource "google_compute_attached_disk" "attach-disk" {
  disk     = module.disk.gc_disk_id
  instance = google_compute_instance.compute_instance.id
}

output "appeared-key" {
  value = "jenkinsUser4:${file("key-file.txt")}"
}