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
    credentials = file("terraform-gcp-jenkins-project-2b58b9d2de0e.json")
  }
}

provider "google" {
  credentials = "terraform-gcp-jenkins-project-2b58b9d2de0e.json"

  project = "terraform-gcp-jenkins-project"
  region = "us-east1"
  zone = "us-east1-a"
}