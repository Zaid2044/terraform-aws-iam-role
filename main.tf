data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"

      identifiers = [
        var.service_principal
      ]
    }
  }
}

resource "aws_iam_role" "this" {
  name = "${local.name_prefix}-${var.role_name}-role"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-${var.role_name}-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "this" {
  name = "${local.name_prefix}-${var.role_name}-profile"

  role = aws_iam_role.this.name

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-${var.role_name}-profile"
    }
  )
}

