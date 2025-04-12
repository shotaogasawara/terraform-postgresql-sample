# Terraform PostgreSQL ユーザー管理サンプル

このリポジトリは、TerraformとPostgreSQLプロバイダーを使用してPostgreSQLのユーザー管理を行うサンプルコードです。

## 前提条件

- [Terraform](https://www.terraform.io/downloads.html) (最新版)
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## セットアップ

### 1. PostgreSQLコンテナの起動

以下のコマンドを実行して、PostgreSQL 16のコンテナを起動します：

```bash
docker-compose up -d
```

コンテナが正常に起動したことを確認します：

```bash
docker-compose ps
```

### 2. Terraformの初期化

以下のコマンドを実行して、Terraformを初期化します：

```bash
terraform init
```

### 3. 実行計画の確認

以下のコマンドを実行して、Terraformの実行計画を確認します：

```bash
terraform plan
```

### 4. リソースの作成

以下のコマンドを実行して、リソースを作成します：

```bash
terraform apply
```

確認メッセージが表示されたら、`yes`と入力して実行を続行します。

## 作成されるリソース

- データベース: `my_database`
- ロール:
  - `app_user`: アプリケーション用ユーザー
  - `read_only_user`: 読み取り専用ユーザー
  - `admin_user`: 管理者ユーザー
- スキーマ: `app_schema`
- 権限設定:
  - `app_user`: スキーマに対するCREATEとUSAGE権限
  - `read_only_user`: スキーマに対するUSAGE権限とテーブルに対するSELECT権限

## PostgreSQLへの接続

以下のコマンドを使用して、PostgreSQLに接続できます：

### 管理者ユーザーとして接続

```bash
psql -h localhost -p 5432 -U postgres -d postgres
```

パスワード: `postgres`

### アプリケーションユーザーとして接続

```bash
psql -h localhost -p 5432 -U app_user -d my_database
```

パスワード: `app_password`

### 読み取り専用ユーザーとして接続

```bash
psql -h localhost -p 5432 -U read_only_user -d my_database
```

パスワード: `readonly_password`

## リソースの削除

以下のコマンドを実行して、作成したリソースを削除します：

```bash
terraform destroy
```

確認メッセージが表示されたら、`yes`と入力して実行を続行します。

## PostgreSQLコンテナの停止

以下のコマンドを実行して、PostgreSQLコンテナを停止します：

```bash
docker-compose down
```

データを完全に削除する場合は、以下のコマンドを実行します：

```bash
docker-compose down -v
