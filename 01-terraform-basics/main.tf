provider "aws" {
  profile = "devops_profile"
  region = "us-east-1"
  version = "~> 2.46"
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket-jsparmani-001"
  versioning {
    enabled=true
  }
}

resource "aws_iam_user" "my_iam_user" {
  name = "my_iam_user_abc_updated"
}



