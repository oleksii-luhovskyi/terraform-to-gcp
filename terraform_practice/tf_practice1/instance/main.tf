module "network" {
  source = "../vpc"

  NETWORK_NAME = "custom-vpc-via-tf"
  SUB_NAME     = "custom-subntw-via-tf"
}

module "disk" {
  source = "../compute_disk"
}

data "local_file" "ssh_key_file" {
  filename = var.DATA_FILE_NAME
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
    ssh-keys = "${var.DATA_USER}:${data.local_file.ssh_key_file.content}"
  }

  metadata_startup_script = var.INSTANCE_STARTUP_METADATA

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

resource "google_compute_project_metadata" "metadata" {
  project = "terraform-gcp-jenkins-project"
  metadata = {
    ssh-keys = "${var.DATA_USER}:${data.local_file.ssh_key_file.content}"
  }
}

resource "google_compute_attached_disk" "attach-disk" {
  disk     = module.disk.gc_disk_id
  instance = google_compute_instance.compute_instance.id
}