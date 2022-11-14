variable "region" {
  type        = string
  description = "Region to deploy to"
}

variable "subnet_id" {
  type        = string
  description = "subnet id to deploy things to"
}

variable "public_dns_namespace_name" {
  type        = string
  description = "name of the public dns namespace"
}

variable "private_dns_namespace_name" {
  type        = string
  description = "name of the private dns namespace"
}