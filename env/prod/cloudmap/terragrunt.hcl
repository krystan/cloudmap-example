include {
  path = find_in_parent_folders()
}

inputs = {
  region = "eu-west-1"
  subnet_id = "subnet-0c59a157"
  public_dns_namespace_name = "test.nocashvalue.net"
  private_dns_namespace_name = "krystan.example.local"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-west-1"
}
EOF
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {}
}
EOF
}

terraform {
  source = "../../../modules//cloudmap"

  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=10m"]
  }
}