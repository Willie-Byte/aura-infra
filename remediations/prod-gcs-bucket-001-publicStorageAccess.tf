resource "google_storage_bucket" "secure_bucket" {
  name                        = var.bucket_name
  location                    = var.bucket_location
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}

resource "google_storage_bucket_iam_binding" "prevent_public_access" {
  bucket = google_storage_bucket.secure_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "group:bucket-readers@example.com"
  ]
}

variable "bucket_name" {
  type = string
}

variable "bucket_location" {
  type    = string
  default = "US"
}