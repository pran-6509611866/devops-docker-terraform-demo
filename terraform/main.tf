provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "myapp" {
  name = var.ecr_repo_name
}