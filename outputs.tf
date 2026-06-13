output "user_name" {
  description = "IAM user name"

  value = var.create_user ? aws_iam_user.this[0].name : null
}

output "user_arn" {
  description = "IAM user ARN"

  value = var.create_user ? aws_iam_user.this[0].arn : null
}

output "role_name" {
  description = "IAM role name"

  value = var.create_role ? aws_iam_role.this[0].name : null
}

output "role_arn" {
  description = "IAM role ARN"

  value = var.create_role ? aws_iam_role.this[0].arn : null
}

output "instance_profile_name" {
  description = "Instance profile name"

  value = var.create_instance_profile ? aws_iam_instance_profile.this[0].name : null
}

output "instance_profile_arn" {
  description = "Instance profile ARN"

  value = var.create_instance_profile ? aws_iam_instance_profile.this[0].arn : null
}

output "custom_policy_name" {
  description = "Custom IAM policy name"

  value = var.create_custom_policy ? aws_iam_policy.custom[0].name : null
}

output "custom_policy_arn" {
  description = "Custom IAM policy ARN"

  value = var.create_custom_policy ? aws_iam_policy.custom[0].arn : null
}

output "attached_managed_policy_arns" {
  description = "AWS managed policies attached to the user or role"

  value = var.aws_managed_policy_arns
}