data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "selected" {
  id     = var.subnet_id
  vpc_id = data.aws_vpc.default.id
}


resource "aws_security_group" "ec2" {
  name        = "allow_tls"
  description = "Allow basic services"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "TLS from Anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [local.anywhere_cidr_block]
  }

  ingress {
    description = "SSH from Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.anywhere_cidr_block]
  }

  ingress {
    description = "Ping from Anywhere"
    from_port   = 23
    to_port     = 23
    protocol    = "icmp"
    cidr_blocks = [local.anywhere_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.anywhere_cidr_block]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name      = "for_cloudmap_demo"
    Terraform = true
    env       = "prod"
  }
}