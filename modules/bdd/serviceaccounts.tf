resource "google_project_iam_member" "tekton_sa_owner_binding" {
  provider = google
  role     = "roles/owner"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}

resource "google_project_iam_member" "tekton_sa_iam_sec_admin_binding" {
  provider = google
  role     = "roles/iam.securityAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}

resource "google_project_iam_member" "tekton_sa_iam_prj_admin_binding" {
  provider = google
  role     = "roles/resourcemanager.projectIamAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}

resource "google_project_iam_member" "tekton_sa_access_policy_admin_binding" {
  provider = google
  role     = "roles/accesscontextmanager.policyAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd"
}