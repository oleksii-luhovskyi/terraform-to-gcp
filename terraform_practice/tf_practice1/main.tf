module "gcp_instance" {
  source = "./instance"

  INSTANCE_NAME = "instance-via-terraform"
}