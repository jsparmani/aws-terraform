provider "aws" {
  profile = "devops_profile"
  region  = "us-east-1"
  version = "~> 2.46"
}
variable "application_name" {
  default = "07-backend-state"
}

variable "project_name" {
  default = "users"
}

variable "environment" {
  default = "dev"
}


terraform {
  backend "s3" {
    bucket         = "dev-applications-backend-state-jsparmani"
    key            = "{var.application_name}-{var.project_name}-{var.environment}"
    region         = "us-east-1"
    dynamodb_table = "dev_application_locks"
    encrypt        = "true"
  }
}


resource "aws_iam_user" "my_iam_user" {
  name = "${terraform.workspace}_my_iam_user_abc"
}
