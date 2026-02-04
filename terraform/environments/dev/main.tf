module "dev_stack" {
  source   = "../../modules/docker_stack"
  env_pfx  = "dev"
  app_port = 5001
}

output "dev_app_name" {
  value = module.dev_stack.container_name
}
