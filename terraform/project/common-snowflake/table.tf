resource "snowflake_table_grant" "select_example_db" {
  database_name = snowflake_database.example_db.name

  privilege = "SELECT"
  roles     = ["role1"]
  on_future = true
}
resource "snowflake_table_grant" "insert_example_db" {
  database_name = snowflake_database.example_db.name

  privilege = "INSERT"
  roles     = ["role1"]
  on_future = true
}

resource "snowflake_table_grant" "update_example_db" {
  database_name = snowflake_database.example_db.name

  privilege = "UPDATE"
  roles     = ["role1"]
  on_future = true
}
