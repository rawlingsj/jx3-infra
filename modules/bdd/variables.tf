// ----------------------------------------------------------------------------
// Required Variables
// ----------------------------------------------------------------------------
variable "tekton_sa_email" {
  description = "The name of the GCP project to use"
  type        = string
}
// ----------------------------------------------------------------------------
// Optional Variables
// ----------------------------------------------------------------------------
variable "cluster_name" {
  description = "Name of the Kubernetes cluster to create"
  type        = string
  default     = ""
}