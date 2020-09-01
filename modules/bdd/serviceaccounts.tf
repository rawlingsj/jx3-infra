resource "google_project_iam_member" "tekton_sa_storage_object_admin_binding" {
  provider = google
  role     = "roles/owner"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}

resource "google_project_iam_member" "tekton_sa_storage_object_admin_binding" {
  provider = google
  role     = "roles/iam.securityAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}

resource "google_project_iam_member" "tekton_sa_storage_object_admin_binding" {
  provider = google
  role     = "roles/resourcemanager.projectIamAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}

resource "google_project_iam_member" "tekton_sa_storage_object_admin_binding" {
  provider = google
  role     = "roles/accesscontextmanager.policyAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}

resource "google_project_iam_member" "tekton_sa_storage_object_admin_binding" {
  provider = google
  role     = "roles/resourcemanager.projects.getIamPolicy"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}
