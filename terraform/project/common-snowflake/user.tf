resource "snowflake_user" "ogawa" {
  provider     = snowflake.user_admin
  name         = "ogawa"
  default_role = snowflake_role.developer.name
  comment      = "Created by Terraform."
}
