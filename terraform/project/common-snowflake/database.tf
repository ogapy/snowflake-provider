resource "snowflake_database" "example_db" {
  name                        = "example1"
  comment                     = "This is example db."
  data_retention_time_in_days = 3
}

resource "snowflake_database_grant" "grant" {
  database_name = snowflake_database.example_db.name

  privilege = "USAGE"
  roles     = ["role1", "role2"]
}
