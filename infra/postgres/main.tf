provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "security_groups" {
  source = "./modules/security-groups"
}

module "rds" {
  source            = "./modules/rds"
  security_group_id = module.security_groups.sample_app_postgres_security_group_id

  depends_on = [module.security_groups]
}


