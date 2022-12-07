locals {
  cluster_name = "learn-eks-${random_string.suffix.result}"
}

data "aws_availability_zones" "available" {}

resource "random_string" "suffix" {
  length  = 8
  special = false
}