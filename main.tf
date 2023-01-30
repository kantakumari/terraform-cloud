terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  version = "3.5.0"
  project = var.project_name
  region  = var.region
  zone    = var.zone
}
variable "gcp_credentials" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
}
resource "google_storage_bucket" "auto-expire" {
  name          = var.bucket_name
  location      = var.bucket_location
  force_destroy = true

  public_access_prevention = "enforced"
}