output "address" {
  value       = aws_db_instance.example.address
  description = "Connect to PROD database at this endpoint"
}

output "port" {
  value       = aws_db_instance.example.port
  description = "The port PROD  database is listening on"
}
