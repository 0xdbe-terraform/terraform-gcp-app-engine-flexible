resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.location_id
}

resource "google_project_service" "appengineflex" {
  project = var.project_id
  service = "appengineflex.googleapis.com"
  disable_dependent_services = false
}

resource "google_project_iam_member" "gae_api" {
  project = var.project_id
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
}

resource "google_project_iam_member" "logs_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
}

resource "google_project_iam_member" "storage_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
}