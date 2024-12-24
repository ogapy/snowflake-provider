terraform {
  required_version = "~> 1.4.6"

  backend "s3" {
    bucket = "ogapy-snowflake-terraform"
    region = "ap-northeast-1"
    key = "common-snowflake.tfstate"
    dynamodb_table = "ogawa-terraform-state-lock"
  } 

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.47.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
  profile = "private"
  default_tags {
    tags = {
      env = var.environment
      project = var.project
      owner = "terraform"
      tfstate = "common-github"
    }
  }
}
