variable "iam_user_name_prefix" {
  # type = string, and(default), number, bool, map, set, object, tuple
  default = "my_iam_user"
}


provider "aws" {
  profile = "devops_profile"
  region  = "us-east-1"
  version = "~> 2.46"
}

resource "aws_iam_user" "my_iam_users" {
  count = 1
  name  = "${var.iam_user_name_prefix}_${count.index}"
}



