resource "snowflake_schema" "example_schema" {
  database = snowflake_database.example_db.name
  name     = "example_schema"
  comment  = "This is an example schema."

  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}

resource "snowflake_schema_grant" "grant" {
  database_name = snowflake_database.example_db.name
  schema_name   = snowflake_schema.example_schema.name

  privilege = "USAGE"
  roles     = ["role1", "role2"] # 利用できるようにしたいロールを列挙する
  on_future = true
}
