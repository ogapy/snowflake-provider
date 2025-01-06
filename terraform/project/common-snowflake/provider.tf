terraform {
  backend "s3" {
    bucket         = "ogapy-snowflake-terraform"
    region         = "ap-northeast-1"
    key            = "common-snowflake.tfstate"
    dynamodb_table = "ogawa-terraform-state-lock"
  }

  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

provider "snowflake" {
  role  = "SYSADMIN"
  alias = "sys_admin"
}

provider "snowflake" {
  role  = "SECURITYADMIN"
  alias = "security_admin"
}

provider "snowflake" {
  role  = "USERADMIN"
  alias = "user_admin"
}

provider "snowflake" {
  role  = "TERRAFORM"
  alias = "terraform"
}
