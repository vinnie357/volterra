# login
provider "volterra" {
  api_p12_file = var.volterra_p12_path
  url          = var.volterra_api_url
}
# deploy secure k8s gateway
module "skg" {
  source                    = "volterraedge/secure-k8s-gateway/volterra"
  version                   = "0.1.1"
  skg_name                  = var.name
  volterra_namespace        = var.volterra_namespace
  volterra_namespace_exists = true
  app_domain                = var.app_domain
  aws_secret_key            = var.aws_secret_access_key
  aws_access_key            = var.aws_access_key_id
  aws_region                = var.aws_region
  aws_az                    = var.aws_az
  aws_vpc_cidr              = var.aws_vpc_cidr
  aws_subnet_ce_cidr        = var.aws_subnet_ce_cidr
  aws_subnet_eks_cidr       = var.aws_subnet_eks_cidr
  aws_instance_type         = var.aws_instance_type
  ssh_public_key            = var.ssh_public_key
}
