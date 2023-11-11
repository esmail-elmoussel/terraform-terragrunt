provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "elasticache" {
  source = "./modules/elasticache"
}

# module "ecr" {
#   source = "./modules/ecr"
# }

module "lb" {
  source = "./modules/lb"
}

module "ecs" {
  source           = "./modules/ecs"
  redis_url        = module.elasticache.elasticache_cluster_redis_url
  target_group_arn = module.lb.lb_target_group_arn

  depends_on = [module.elasticache, module.lb]
}
