provider "aws" {
  region = "eu-central-1"
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"
  cluster_name = "stage"
  db_username  = var.DB_USERNAME
  db_password  = var.DB_PASSWORD
}
