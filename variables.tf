variable "project" {
  description = "Project name used for resource naming and tagging"
  type        = string

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "Project name cannot be empty."
  }
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "stage", "prod"], lower(var.environment))
    error_message = "Environment must be one of: dev, stage, prod."
  }
}

variable "create_user" {
  description = "Whether to create an IAM user"
  type        = bool
  default     = false
}

variable "user_name" {
  description = "IAM user name"
  type        = string
  default     = null
}

variable "create_role" {
  description = "Whether to create an IAM role"
  type        = bool
  default     = false
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = null
}

variable "assume_role_policy" {
  description = "IAM role trust policy JSON"
  type        = string
  default     = null
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile for the role"
  type        = bool
  default     = false
}

variable "aws_managed_policy_arns" {
  description = "List of AWS managed policy ARNs to attach"
  type        = list(string)
  default     = []
}

variable "create_custom_policy" {
  description = "Whether to create a custom IAM policy"
  type        = bool
  default     = false
}

variable "custom_policy_name" {
  description = "Custom IAM policy name"
  type        = string
  default     = null
}

variable "custom_policy_json" {
  description = "JSON policy document for custom IAM policy"
  type        = string
  default     = null
}

variable "path" {
  description = "IAM path"
  type        = string
  default     = "/"
}

variable "force_destroy" {
  description = "Delete IAM user even if it has access keys, MFA devices, or policies"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags applied to all IAM resources"
  type        = map(string)
  default     = {}
}