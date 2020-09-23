resource "google_project_iam_member" "tekton_sa_storage_object_admin_binding" {
  provider = google
  role     = "roles/storage.objectAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkinsxio"
}

resource "google_project_iam_member" "tekton_sa_storage_admin_binding" {
  provider = google
  role     = "roles/storage.admin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkinsxio"
}