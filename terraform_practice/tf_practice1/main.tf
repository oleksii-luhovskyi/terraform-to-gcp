module "gcp_instance" {
  source = "./instance"

  INSTANCE_NAME = "instance-via-terraform"
}

output "out" {
  value = module.gcp_instance.appeared-key
}