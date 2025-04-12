terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.25.0"
    }
  }
}

provider "postgresql" {
  host            = "localhost"
  port            = 5432
  username        = "postgres"
  password        = "postgres"
  sslmode         = "disable"
  connect_timeout = 15
}

# データベースの作成
resource "postgresql_database" "my_db" {
  name     = "my_database"
  owner    = "postgres"
  encoding = "UTF8"
}

# ロールの作成
resource "postgresql_role" "app_user" {
  name     = "app_user"
  login    = true
  password = "app_password"
}

resource "postgresql_role" "read_only_user" {
  name     = "read_only_user"
  login    = true
  password = "readonly_password"
}

resource "postgresql_role" "admin_user" {
  name     = "admin_user"
  login    = true
  password = "admin_password"
  superuser = true
}

# スキーマの作成
resource "postgresql_schema" "app_schema" {
  name  = "app_schema"
  owner = postgresql_role.app_user.name
  database = postgresql_database.my_db.name
}

# 権限の設定
resource "postgresql_grant" "app_user_schema_usage" {
  database    = postgresql_database.my_db.name
  role        = postgresql_role.app_user.name
  schema      = postgresql_schema.app_schema.name
  object_type = "schema"
  privileges  = ["CREATE", "USAGE"]
}

resource "postgresql_grant" "read_only_schema_usage" {
  database    = postgresql_database.my_db.name
  role        = postgresql_role.read_only_user.name
  schema      = postgresql_schema.app_schema.name
  object_type = "schema"
  privileges  = ["USAGE"]
}

resource "postgresql_grant" "read_only_tables" {
  database    = postgresql_database.my_db.name
  role        = postgresql_role.read_only_user.name
  schema      = postgresql_schema.app_schema.name
  object_type = "table"
  privileges  = ["SELECT"]
}
