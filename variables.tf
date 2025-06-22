variable "region" {
  default = "us-east-1"
}

variable "iam_user" {
  default = "dev-user"
}

variable "iam_group" {
  default = "developers"
}

variable "iam_role" {
  default = "ec2-read-s3-role"
}

variable "s3_readonly_policy_name" {
  default = "S3ReadOnlyPolicy"
}

