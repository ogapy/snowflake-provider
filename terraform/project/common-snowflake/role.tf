locals {
  snowflake_role = {
    accountadmin  = "ACCOUNTADMIN"
    sysadmin      = "SYSADMIN"
    securityadmin = "SECURITYADMIN"
    terraform     = "TERRAFORM"
  }
}

resource "snowflake_role" "developer" {
  provider = snowflake.security_admin
  name     = upper("developer")
  comment  = "A role for developer"
}

resource "snowflake_role_grants" "accountadmin" {
  provider               = snowflake.security_admin
  role_name              = locals.snowflake_role.accountadmin
  enable_multiple_grants = true
  users = [
    snowflake_user.ogawa.name
  ]
}

resource "snowflake_role_grants" "developer" {
  provider               = snowflake.security_admin
  role_name              = snowflake_role.developer.name
  enable_multiple_grants = true

  roles = [locals.snowflake_role.sysadmin]
  users = [
    snowflake_user.ogawa.name
  ]
}
