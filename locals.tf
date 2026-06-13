locals {
  name_prefix = "${var.project}-${var.environment}"

  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "Terraform"
      Module      = "iam"
    },
    var.tags
  )

  user_name = (
    var.create_user && var.user_name != null
    ? "${local.name_prefix}-${var.user_name}"
    : null
  )

  role_name = (
    var.create_role && var.role_name != null
    ? "${local.name_prefix}-${var.role_name}"
    : null
  )

  custom_policy_name = (
    var.create_custom_policy && var.custom_policy_name != null
    ? "${local.name_prefix}-${var.custom_policy_name}"
    : null
  )

  instance_profile_name = (
    var.create_instance_profile && var.role_name != null
    ? "${local.name_prefix}-${var.role_name}-instance-profile"
    : null
  )
}