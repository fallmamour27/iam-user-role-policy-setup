# 📦 AWS IAM Setup with Terraform

This project provisions AWS IAM resources using Terraform, including:

- A user (`dev-user`)
- A group (`developers`) with S3 read-only access
- A custom IAM policy
- An EC2 role with the same policy

## 🛠️ Tools

- Terraform
- AWS IAM
- AWS CLI
- macOS Terminal (zsh)

## 🚀 How to Use

```bash
terraform init
terraform apply

