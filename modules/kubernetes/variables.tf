variable "region" {
  description = "AWS region"
  type        = string
}

variable "private_subnets_cidr" {
    description = "List of private subnet cidr blocks"
    type = list
}

variable "availability_zones" {
    description = "List of availability zones"
    type = list
}
