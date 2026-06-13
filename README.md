# Terraform AWS IAM Role Module

Reusable Terraform module for creating AWS IAM Roles, Instance Profiles, and Managed Policy Attachments.

## Usage

```hcl
module "ec2_role" {
  source = "git::https://github.com/Zaid2044/terraform-aws-iam-role.git?ref=v1.0.0"

  project     = "platform"
  environment = "dev"

  role_name         = "ec2"
  service_principal = "ec2.amazonaws.com"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}
```

## Versioning

This module follows Semantic Versioning.

Examples:

* v1.0.0
* v1.1.0
* v2.0.0