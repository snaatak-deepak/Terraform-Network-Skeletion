output "vpc-id" {
  value = aws_vpc.dev-vpc.id
}

#>>>>>>>>>>>>>>>>>>>SSH-KEY-OUTPUT>>>>>>>>>>>>>>>>>>>>>>>>>>>
output "ssh_key_name" {
  description = "The name of the SSH key pair created in AWS"
  value       = aws_key_pair.dev_ssh_key.key_name
}

output "ssh_private_key_path" {
  description = "Path to the generated .pem private key"
  value       = local_file.private_key_pem.filename
}

