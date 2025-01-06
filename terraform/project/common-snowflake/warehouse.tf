resource "snowflake_warehouse" "query-small" {
  provider = snowflake.sys_admin
  name     = upper("query_small")
  comment  = "Warehouse for query on small size"

  warehouse_size               = "small"
  auto_resume                  = true
  auto_suspend                 = 60
  statement_timeout_in_seconds = 3600 // 1 hour
  initially_suspended          = true
}
