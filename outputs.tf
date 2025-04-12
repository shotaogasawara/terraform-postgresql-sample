output "database_name" {
  description = "作成されたデータベース名"
  value       = postgresql_database.my_db.name
}

output "app_user" {
  description = "アプリケーションユーザー名"
  value       = postgresql_role.app_user.name
}

output "read_only_user" {
  description = "読み取り専用ユーザー名"
  value       = postgresql_role.read_only_user.name
}

output "admin_user" {
  description = "管理者ユーザー名"
  value       = postgresql_role.admin_user.name
}

output "app_schema" {
  description = "作成されたスキーマ名"
  value       = postgresql_schema.app_schema.name
}

output "connection_string" {
  description = "PostgreSQL接続文字列（パスワードなし）"
  value       = "postgresql://${postgresql_role.app_user.name}:@${var.db_host}:${var.db_port}/${postgresql_database.my_db.name}"
  sensitive   = false
}
