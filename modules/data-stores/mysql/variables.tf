variable "db_username" {
  description = "The username for the mysql database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the mysql database"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "The name of the cluster the DB will be deployed to"
  type        = string
}
