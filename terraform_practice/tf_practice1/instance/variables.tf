variable "INSTANCE_NAME" {
  type = string
  default = ""
}

variable "INSTANCE_ZONE" {
  type = string
  default = "us-central1-b"
}

variable "INSTANCE_MACHINE_TYPE" {
  type = string
  default = "n1-standard-1"
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