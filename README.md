# Terraform AWS IAM Role Module

Reusable Terraform module for creating AWS IAM Roles, Instance Profiles, and Managed Policy Attachments.

## Features

* Create IAM Roles
* Configurable Trust Relationships
* Attach AWS Managed Policies
* Create IAM Instance Profiles
* Consistent Tagging Strategy
* Reusable Module Interface
* Semantic Versioning Support

## Requirements

| Name         | Version  |
| ------------ | -------- |
| Terraform    | >= 1.8.0 |
| AWS Provider | ~> 6.0   |

## Architecture

```text
IAM Role
│
├── Trust Policy
│
├── Managed Policy Attachments
│
└── Instance Profile
```

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

## Example Use Cases

### EC2

```hcl
service_principal = "ec2.amazonaws.com"
```

### Lambda

```hcl
service_principal = "lambda.amazonaws.com"
```

### ECS Tasks

```hcl
service_principal = "ecs-tasks.amazonaws.com"
```

## Inputs

| Name                | Type         | Description                            |
| ------------------- | ------------ | -------------------------------------- |
| project             | string       | Project name                           |
| environment         | string       | Environment name                       |
| role_name           | string       | IAM role name                          |
| service_principal   | string       | AWS service allowed to assume the role |
| managed_policy_arns | list(string) | AWS managed policies to attach         |
| tags                | map(string)  | Additional resource tags               |

## Outputs

| Name                  | Description               |
| --------------------- | ------------------------- |
| role_id               | IAM role ID               |
| role_name             | IAM role name             |
| role_arn              | IAM role ARN              |
| instance_profile_name | IAM instance profile name |
| instance_profile_arn  | IAM instance profile ARN  |

## Security Best Practices

This module is designed to support:

* AWS Systems Manager (SSM)
* Session Manager
* IAM-based access management

Instead of:

* SSH access
* Open port 22
* Long-lived key pairs

## Validation

The module is validated using:

* terraform fmt
* terraform validate
* Example deployment testing

## Repository Structure

```text
terraform-aws-iam-role
├── examples
│   └── basic
├── .github
│   └── workflows
├── main.tf
├── variables.tf
├── outputs.tf
├── locals.tf
├── versions.tf
└── README.md
```

## Versioning

This module follows Semantic Versioning.

Examples:

* v1.0.0
* v1.1.0
* v2.0.0

## Future Enhancements

* Custom IAM Policies
* Inline Policies
* Permission Boundaries
* Cross-Account Role Support
* OIDC Trust Relationships
