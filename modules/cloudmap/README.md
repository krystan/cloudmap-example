# Docs for example cloudmap
This is not a secure module run tfsec and wonder at the security flaws :) Its just me working things out, use at own risk

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_service_discovery_instance.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_instance) | resource |
| [aws_service_discovery_instance.public_example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_instance) | resource |
| [aws_service_discovery_private_dns_namespace.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |
| [aws_service_discovery_public_dns_namespace.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_public_dns_namespace) | resource |
| [aws_service_discovery_service.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |
| [aws_service_discovery_service.public_example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_dns_namespace_name"></a> [private\_dns\_namespace\_name](#input\_private\_dns\_namespace\_name) | name of the private dns namespace | `string` | n/a | yes |
| <a name="input_public_dns_namespace_name"></a> [public\_dns\_namespace\_name](#input\_public\_dns\_namespace\_name) | name of the public dns namespace | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy to | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet id to deploy things to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | Id Of the EC2 Instance being used as an example |
| <a name="output_private_dns_namespace_name"></a> [private\_dns\_namespace\_name](#output\_private\_dns\_namespace\_name) | Private DNS Namespace Name |
| <a name="output_private_instance_id"></a> [private\_instance\_id](#output\_private\_instance\_id) | Private Service Discovery Instance Id |
| <a name="output_private_service_id"></a> [private\_service\_id](#output\_private\_service\_id) | Private Service Discovery Service Id |
| <a name="output_public_dns_namespace_name"></a> [public\_dns\_namespace\_name](#output\_public\_dns\_namespace\_name) | Public DNS Namespace Name |
| <a name="output_public_instance_id"></a> [public\_instance\_id](#output\_public\_instance\_id) | Public Service Discovery Instance Id |
| <a name="output_public_service_id"></a> [public\_service\_id](#output\_public\_service\_id) | Public Service Discovery Service Id |
<!-- END_TF_DOCS -->