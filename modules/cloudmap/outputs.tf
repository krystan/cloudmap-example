# Public DNS Namespace Name
output "public_dns_namespace_name" {
  value = aws_service_discovery_public_dns_namespace.example.name
}

# Public Service Discovery Service Id
output "public_service_id" {
  value = aws_service_discovery_instance.public_example.service_id
}

# Public Service Discovery Instance Id
output "public_instance_id" {
  value = aws_service_discovery_instance.public_example.instance_id
}

# Private DNS Namespace Name
output "private_dns_namespace_name" {
  value = aws_service_discovery_private_dns_namespace.example.name
}

# Private Service Discovery Service Id
output "private_service_id" {
  value = aws_service_discovery_instance.example.service_id
}

# Private Service Discovery Instance Id
output "private_instance_id" {
  value = aws_service_discovery_instance.example.instance_id
}

# Id Of the EC2 Instance being used as an example
output "ec2_id" {
  value = aws_instance.web.id
}