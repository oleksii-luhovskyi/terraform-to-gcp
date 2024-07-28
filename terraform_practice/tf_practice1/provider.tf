terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.38.0"
    }
  }

  backend "gcs" {
    bucket = "state-dev-storage-bucket-tf"
    prefix = "tf-practice"
    credentials = "terraform-gcp-jenkins-project-d95c6224f967.json"
  }
}

provider "google" {
  credentials = "terraform-gcp-jenkins-project-d95c6224f967.json"

  project = "terraform-gcp-jenkins-project"
  region = "us-east1"
  zone = "us-east1-a"
}