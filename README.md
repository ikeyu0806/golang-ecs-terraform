# README.md
簡易Golangサービス起動する簡易ECS環境を構築するterraformです。

# ECR
ECRのレポジトリ作成とimage pushは現状手動で行う必要があります。

# terraform

terraform.tfvarsを作成してAWSのアクセスキーとシークレットアクセスキーを記載します。

```
access_key = "xxxx"
secret_key = "xxxx"
```

その後terraformコマンドでAWS環境構築できます
```
# 確認
terraform plan
# 実行
terraform apply
# 環境破棄
terraform destroy
```

terraform apply実行後、ALBのDNSにアクセスするとHello Worldが表示されます。

## Goの起動をローカルで確認

```
cd golang
docker build ./ -t golang_http_test
docker run -p 8080:8080 golang_http_test
```

ブラウザでlocalhost:8080にアクセスするとHello Worldが表示されます
