# tekton bot needs karma to create
resource "google_project_iam_member" "tekton_sa_owner_binding" {
  provider = google
  role     = "roles/owner"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_iam_workload_identity_pool" "jenkins-x-labs-bdd1" {
  provider                  = google-beta
  workload_identity_pool_id = "jenkins-x-labs-bdd1-pool"
  project = "jenkins-x-labs-bdd1"
}

resource "google_project_iam_member" "tekton_sa_iam_sec_admin_binding" {
  provider = google
  role     = "roles/iam.securityAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_project_iam_member" "tekton_sa_iam_prj_admin_binding" {
  provider = google
  role     = "roles/resourcemanager.projectIamAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_project_iam_member" "tekton_sa_access_policy_admin_binding" {
  provider = google
  role     = "roles/accesscontextmanager.policyAdmin"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_project_iam_member" "tekton_sa_kube_engine_developer_binding" {
  provider = google
  role     = "roles/container.developer"
  member   = "serviceAccount:${var.tekton_sa_email}"
  project = "jenkins-x-labs-bdd1"
}

# jx-test-cli needs karam to terraform destroy 

resource "google_service_account" "testgc_sa" {
  provider     = google
  account_id   = "${var.cluster_name}-testgc"
  display_name = substr("JX test GC service account for cluster ${var.cluster_name}", 0, 100)
  project = "jx-labs-infra"
}

resource "google_project_iam_member" "testgc_sa_owner_binding" {
  provider = google
  role     = "roles/owner"
  member   = "serviceAccount:${google_service_account.testgc_sa.email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_project_iam_member" "testgc_sa_iam_sec_admin_binding" {
  provider = google
  role     = "roles/iam.securityAdmin"
  member   = "serviceAccount:${google_service_account.testgc_sa.email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_project_iam_member" "testgc_sa_iam_prj_admin_binding" {
  provider = google
  role     = "roles/resourcemanager.projectIamAdmin"
  member   = "serviceAccount:${google_service_account.testgc_sa.email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_project_iam_member" "testgc_sa_access_policy_admin_binding" {
  provider = google
  role     = "roles/accesscontextmanager.policyAdmin"
  member   = "serviceAccount:${google_service_account.testgc_sa.email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_project_iam_member" "testgc_sa_kube_engine_developer_binding" {
  provider = google
  role     = "roles/container.developer"
  member   = "serviceAccount:${google_service_account.testgc_sa.email}"
  project = "jenkins-x-labs-bdd1"
}

resource "google_service_account_iam_member" "testgc_sa_workload_identity_user" {
  provider           = google
  service_account_id = google_service_account.testgc_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:jx-labs-infra.svc.id.goog[jx/jx-test-gc-jx-cli]"
}
