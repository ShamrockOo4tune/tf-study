terraform {
  backend "s3" {
    bucket         = "shamrockoo4tune-tf-state-1"
    key            = "prod/data-store/mysql/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-locks-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "prod-tf-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = "prod_database"
  username            = var.db_username
  password            = var.db_password
}
