## Enable to work with local and remote states
## run terraform init after uncommenting below
# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "jenkinsxio"

#     workspaces {
#       name = "jx3-infra"
#     }
#   }
# }

module "jx" {
  source                  = "github.com/rawlingsj/terraform-google-jx?ref=master"
  gcp_project             = var.gcp_project
  jx2                     = false
  gsm                     = var.gsm
  cluster_name            = var.cluster_name
  cluster_location        = var.cluster_location
  resource_labels         = var.resource_labels
  node_machine_type       = var.node_machine_type
  min_node_count          = var.min_node_count
  max_node_count          = var.max_node_count
  node_disk_size          = var.node_disk_size
  node_disk_type          = var.node_disk_type
  parent_domain           = var.parent_domain
  tls_email               = var.tls_email
  lets_encrypt_production = var.lets_encrypt_production
  jx_git_url              = var.jx_git_url
  jx_bot_username         = var.jx_bot_username
  jx_bot_token            = var.jx_bot_token
  subdomain               = var.subdomain
}

module "grafana" {
  source = "./modules/grafana"
  cluster_name = module.jx.cluster_name
  depends_on = [
    module.jx
  ]
}

module "jenkinsxio" {
  source = "./modules/jenkinsxio"
  tekton_sa_email = module.jx.tekton_sa_email
  tekton_sa_name  = module.jx.tekton_sa_name
  gcp_project     = var.gcp_project
}

module "bdd" {
  source = "./modules/bdd"
  tekton_sa_email = module.jx.tekton_sa_email
  cluster_name = module.jx.cluster_name
}

output "connect" {
  description = "Connect to cluster"
  value       = "connect to your cluster using `${module.jx.connect}`"
}

output "next" {
  description = "Follow instructions to enable Jenkins X install via GitOps"
  value       = "http://jenkins-x.io/foo"
}