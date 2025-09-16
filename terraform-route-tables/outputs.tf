output "public_route_table_id" {
  description = "ID of the Public Route Table"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of the Private Route Table"
  value       = aws_route_table.private.id
}

output "public_route_table_associations" {
  description = "List of public subnet associations (if any)"
  value       = [for assoc in aws_route_table_association.public_assoc : assoc.id]
}

output "private_route_table_associations" {
  description = "List of private subnet associations (if any)"
  value       = [for assoc in aws_route_table_association.private_assoc : assoc.id]
}
