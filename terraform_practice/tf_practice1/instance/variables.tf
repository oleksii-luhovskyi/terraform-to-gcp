variable "INSTANCE_NAME" {
  type = string
  default = ""
}

variable "INSTANCE_ZONE" {
  type = string
  default = "us-central1-a"
}

variable "INSTANCE_MACHINE_TYPE" {
  type = string
  default = "e2-medium"
}

variable "INSTANCE_ALLOW_STOP_FOR_UPDATE" {
  type = bool
  default = true
}

variable "BOOT_DISK_IMAGE" {
  type = string
  default = "debian-11-bullseye-v20240611"
}

variable "BOOT_DISK_SIZE" {
  type = number
  default = 10
}

variable "BOOT_DISK_AD" {
  default = false
}

variable "SERVICE_ACCOUNT_EMAIL" {
  default = "gcp-wtih-terrraform@terraform-gcp-jenkins-project.iam.gserviceaccount.com"
}

variable "SA_SCOPES" {
  type = list(string)
  default = ["cloud-platform"]
}

variable "TARGET_TAGS" {
  type = list(string)
  default = ["http-server"]
}

variable "INSTANCE_STARTUP_METADATA" {
  type = string
  default = <<-EDT
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install -y openjdk-17-jdk
    sudo apt-get install -y wget
    sudo apt-get install -y git

    sudo mkdir /usr/bin/application
    sudo groupadd deploy_group
    sudo chown :deploy_group /usr/bin/application
    sudo chmod g+rwx /usr/bin/application
    sudo usermod -aG deploy_group oleksii_luhovsky_rd

    groups  oleksii_luhovsky_rd
  EDT
}

//DATA FILE

variable "DATA_FILE_NAME" {
  default = "key-file.txt"
}

variable "DATA_USER" {
  default = "jenkinsUser4"
}