variable "users" {
  default = {
    jay : { country : "India", department : "ABC" },
    sanjay : { country : "US", department : "DEF" },
    dharmi : { country : "Europe", department : "XYZ" }
  }
}

provider "aws" {
  profile = "devops_profile"
  region  = "us-east-1"
  version = "~> 2.46"
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    country : each.value.country,
    department : each.value.department
  }
}



