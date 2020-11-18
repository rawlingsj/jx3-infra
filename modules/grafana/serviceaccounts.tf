resource "google_service_account" "grafana_sa" {
  provider     = google
  account_id   = "${var.cluster_name}-grafana"
  display_name = substr("Grafana service account for cluster ${var.cluster_name}", 0, 100)
  project = "jx-labs-infra"
}

resource "google_project_iam_member" "grafana_sa_sql_binding" {
  provider = google
  role     = "roles/cloudsql.client"
  member   = "serviceAccount:${google_service_account.grafana_sa.email}"
  project = "jx-labs-infra"
}

resource "google_service_account_iam_member" "grafana_sa_workload_identity_user" {
  provider           = google
  service_account_id = google_service_account.grafana_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:jx-labs-infra.svc.id.goog[jx/grafana]"
}