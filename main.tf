resource "aws_iam_user" "this" {
  count = var.create_user ? 1 : 0

  name          = local.user_name
  path          = var.path
  force_destroy = var.force_destroy

  tags = merge(
    local.common_tags,
    {
      Name = local.user_name
    }
  )
}

resource "aws_iam_role" "this" {
  count = var.create_role ? 1 : 0

  name               = local.role_name
  path               = var.path
  assume_role_policy = var.assume_role_policy

  tags = merge(
    local.common_tags,
    {
      Name = local.role_name
    }
  )
}

resource "aws_iam_policy" "custom" {
  count = var.create_custom_policy ? 1 : 0

  name   = local.custom_policy_name
  path   = var.path
  policy = var.custom_policy_json

  tags = merge(
    local.common_tags,
    {
      Name = local.custom_policy_name
    }
  )
}

resource "aws_iam_user_policy_attachment" "managed" {
  for_each = (
    var.create_user
    ? toset(var.aws_managed_policy_arns)
    : []
  )

  user       = aws_iam_user.this[0].name
  policy_arn = each.value
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each = (
    var.create_role
    ? toset(var.aws_managed_policy_arns)
    : []
  )

  role       = aws_iam_role.this[0].name
  policy_arn = each.value
}

resource "aws_iam_user_policy_attachment" "custom" {
  count = (
    var.create_user &&
    var.create_custom_policy
    ? 1
    : 0
  )

  user       = aws_iam_user.this[0].name
  policy_arn = aws_iam_policy.custom[0].arn
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = (
    var.create_role &&
    var.create_custom_policy
    ? 1
    : 0
  )

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.custom[0].arn
}

resource "aws_iam_instance_profile" "this" {
  count = (
    var.create_instance_profile &&
    var.create_role
    ? 1
    : 0
  )

  name = local.instance_profile_name
  role = aws_iam_role.this[0].name

  tags = merge(
    local.common_tags,
    {
      Name = local.instance_profile_name
    }
  )
}