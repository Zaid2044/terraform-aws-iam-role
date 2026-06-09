variable "project" {
  description = "Project name used for resource naming and tagging"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "environment must be one of: dev, stage, prod."
  }
}

variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "service_principal" {
  description = "AWS service allowed to assume the role"
  type        = string
}

variable "managed_policy_arns" {
  description = "Managed policies attached to the role"
  type        = list(string)

  default = []
}

variable "tags" {
  description = "Additional tags"

  type    = map(string)
  default = {}
}