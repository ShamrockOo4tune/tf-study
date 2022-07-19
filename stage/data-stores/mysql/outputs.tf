output "address" {
  value       = module.mysql.address
  description = "Connect to database at this endpoint"
}

output "port" {
  value       = module.mysql.port
  description = "The port database is listening on"
}

output "db_name" {
  value       = module.mysql.db_name
  description = "Name of the database"
}
