module "s3" {
  source = "./modules/s3"
  name   = format("%s-%s", var.name, random_string.rand.result)
}

module "iam" {
  source = "./modules/iam"
  rand   = random_string.rand.result
}

module "security" {
  source              = "./modules/security"
  name                = format("%s-%s", var.name, random_string.rand.result)
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = var.ingress_cidr_blocks
}

module "emr" {
  source                    = "./modules/emr"
  rand                      = random_string.rand.result
  name                      = format("%s-%s", var.name, random_string.rand.result)
  release_label             = var.release_label
  applications              = var.applications
  subnet_id                 = var.subnet_id
  key_name                  = var.key_name
  root_ebs_size             = var.root_ebs_size
  master_instance_type      = var.master_instance_type
  master_ebs_size           = var.master_ebs_size
  core_instance_type        = var.core_instance_type
  core_instance_count       = var.core_instance_count
  core_ebs_size             = var.core_ebs_size
  emr_master_security_group = module.security.emr_master_security_group
  emr_slave_security_group  = module.security.emr_slave_security_group
  emr_ec2_instance_profile  = module.iam.emr_ec2_instance_profile
  emr_service_role          = module.iam.emr_service_role
  emr_autoscaling_role      = module.iam.emr_autoscaling_role
}
