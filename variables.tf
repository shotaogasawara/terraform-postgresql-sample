variable "db_host" {
  description = "PostgreSQLホスト"
  type        = string
  default     = "localhost"
}

variable "db_port" {
  description = "PostgreSQLポート"
  type        = number
  default     = 5432
}

variable "db_name" {
  description = "データベース名"
  type        = string
  default     = "my_database"
}

variable "db_username" {
  description = "PostgreSQL管理者ユーザー名"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "PostgreSQL管理者パスワード"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "app_user_password" {
  description = "アプリケーションユーザーのパスワード"
  type        = string
  default     = "app_password"
  sensitive   = true
}

variable "read_only_password" {
  description = "読み取り専用ユーザーのパスワード"
  type        = string
  default     = "readonly_password"
  sensitive   = true
}

variable "admin_password" {
  description = "管理者ユーザーのパスワード"
  type        = string
  default     = "admin_password"
  sensitive   = true
}
