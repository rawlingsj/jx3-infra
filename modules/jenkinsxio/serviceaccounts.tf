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

resource "google_project_iam_member" "tekton_sa_cloud_builder_binding" {
  provider = google
  role     = "roles/cloudbuild.builds.builder"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkinsxio"
}

resource "google_project_iam_member" "tekton_sa_cloud_builder_viewlogs_binding" {
  provider = google
  role     = "roles/viewer"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkinsxio"
}

// ----------------------------------------------------------------------------
// BDD bot
resource "google_service_account_iam_member" "bdd_sa_workload_identity_user" {
  provider           = google
  service_account_id = google_service_account.tekton_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gcp_project}.svc.id.goog[${var.jenkins_x_namespace}/bdd-bot]"
}

// ----------------------------------------------------------------------------
// Plugins bot
resource "google_service_account_iam_member" "plugins_sa_workload_identity_user" {
  provider           = google
  service_account_id = google_service_account.tekton_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gcp_project}.svc.id.goog[${var.jenkins_x_namespace}/plugins-bot]"
}

// ----------------------------------------------------------------------------
// Version Stream bot
resource "google_service_account_iam_member" "vs_sa_workload_identity_user" {
  provider           = google
  service_account_id = google_service_account.tekton_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gcp_project}.svc.id.goog[${var.jenkins_x_namespace}/vs-bot]"
}