generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {}
}
EOF
}

remote_state {
  backend = "s3"
  config = {
        bucket         = "com.krystanhonour.production.cloudmap.learn.tf.state"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        region         = "eu-west-1"
        encrypt        = true
        dynamodb_table = "terraform_cloudmap_study_lock_table"
        s3_bucket_tags = {
            Terraform   = "true"
            Environment = "prod"
        }
        dynamodb_table_tags = {
            owner       = "terragrunt"
            name        = "Terraform lock table cloudmap learn"
            Terraform   = "true"
            Environment = "prod"
        }
    }
}