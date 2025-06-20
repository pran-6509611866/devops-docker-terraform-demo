variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ecr_repo_name" {
  description = "ECR repository name"
  type        = string
  default     = "myapp"
}