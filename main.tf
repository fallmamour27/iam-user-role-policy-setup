provider "aws" {
  region = var.region
}

resource "aws_iam_group" "developers" {
  name = var.iam_group
}

resource "aws_iam_user" "dev_user" {
  name = var.iam_user
}

resource "aws_iam_group_membership" "group_membership" {
  name  = "dev-group-membership"
  users = [aws_iam_user.dev_user.name]
  group = aws_iam_group.developers.name
}

resource "aws_iam_policy" "s3_readonly" {
  name        = var.s3_readonly_policy_name
  description = "Read-only access to S3"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:Get*", "s3:List*"],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "attach_policy" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.s3_readonly.arn
}

resource "aws_iam_role" "ec2_s3_role" {
  name = var.iam_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_readonly.arn
}

