output "address" {
  value       = aws_db_instance.instance.address
  description = "Connect to database at this endpoint"
}

output "port" {
  value       = aws_db_instance.instance.port
  description = "The port database is listening on"
}

output "db_name" {
  value       = aws_db_instance.instance.db_name
  description = "Name of the database"
}
