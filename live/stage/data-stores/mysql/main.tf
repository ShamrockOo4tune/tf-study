terraform {
  backend "s3" {
    bucket         = "shamrockoo4tune-tf-state"
    key            = "stage/data-store/mysql/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = "example_database"

  #credentials are set with env.variables
  username = var.db_username
  password = var.db_password
}
