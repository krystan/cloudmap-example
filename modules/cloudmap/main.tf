#Public 
locals {
  anywhere_cidr_block      = "0.0.0.0/0"
  anywhere_ipv6_cidr_block = "::/0"
}

resource "aws_service_discovery_public_dns_namespace" "example" {
  name        = var.public_dns_namespace_name
  description = "example"

  tags = {
    terraform = "true"
    env       = "prod"
  }
}

resource "aws_service_discovery_service" "public_example" {
  name = "example"

  dns_config {
    namespace_id = aws_service_discovery_public_dns_namespace.example.id

    dns_records {
      ttl  = 30
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_instance" "public_example" {
  instance_id = "example1"
  service_id  = aws_service_discovery_service.public_example.id

  attributes = {
    AWS_INSTANCE_IPV4 = aws_instance.web.public_ip
    key               = "custom"
    value             = "managed by terraform"
  }
}

# Private
resource "aws_service_discovery_private_dns_namespace" "example" {
  name        = var.private_dns_namespace_name
  description = "LearnCloudMap"
  vpc         = data.aws_vpc.default.id

  tags = {
    terraform = "true"
    env       = "prod"
  }
}

resource "aws_service_discovery_service" "example" {
  name = "example"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.example.id

    dns_records {
      ttl  = 30
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_instance" "example" {
  instance_id = "example1"
  service_id  = aws_service_discovery_service.example.id

  attributes = {
    AWS_INSTANCE_IPV4 = aws_instance.web.private_ip
    key               = "custom"
    value             = "managed by terraform"
  }
}
