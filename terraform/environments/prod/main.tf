module "prod_stack" {
  source   = "../../modules/docker_stack"
  env_pfx  = "prod"
  app_port = 5000
}

output "prod_app_name" {
  value = module.prod_stack.container_name
}
