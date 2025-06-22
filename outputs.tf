output "user_arn" {
  value = aws_iam_user.dev_user.arn
}

output "group_name" {
  value = aws_iam_group.developers.name
}

output "role_arn" {
  value = aws_iam_role.ec2_s3_role.arn
}

