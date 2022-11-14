data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  iam_instance_profile   = aws_iam_instance_profile.web.id

  tags = {
    Name      = "HelloWorld"
    Terraform = "true"
    env       = "prod"
  }
}

resource "aws_iam_instance_profile" "web" {
  name = "web_profile"
  role = "AmazonSSMRoleForAutomationAssumeQuickSetup"
}