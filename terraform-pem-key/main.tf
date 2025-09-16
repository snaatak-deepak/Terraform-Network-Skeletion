#>>>>>>>>>>>>>>>>>>>VPC-CREATION-CODE>>>>>>>>>>>>>>>>>>>>>>>>>>>
resource "aws_vpc" "dev-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  tags                 = var.vpc_tags
}

#>>>>>>>>>>>>>>>>>>>SSH-KEY-CREATION>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Generate SSH key pair
resource "tls_private_key" "dev_ssh" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Save private key locally as .pem
resource "local_file" "private_key_pem" {
  content         = tls_private_key.dev_ssh.private_key_pem
  filename        = "${path.module}/dev-otms-cloudops-1.pem"
  file_permission = "0600"
}

# Create AWS key pair with generated public key
resource "aws_key_pair" "dev_ssh_key" {
  key_name   = var.ssh_key_name
  public_key = tls_private_key.dev_ssh.public_key_openssh
}

