# examples/basic/main.tf

terraform {
  required_version = ">= 1.8.0"
}

provider "aws" {
  region = "ap-south-1"
}

module "iam_role" {
  source = "../../"

  project     = "platform"
  environment = "dev"

  role_name         = "ec2"
  service_principal = "ec2.amazonaws.com"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}