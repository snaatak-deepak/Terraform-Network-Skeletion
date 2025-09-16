terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  standard_tags = {
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
    CostCenter  = var.cost_center
    ManagedBy   = "terraform"
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = merge(
    local.standard_tags,
    { Name = "${var.name_prefix}-${var.environment}-public-rt" }
  )
}

# Public Default Route (Optional)
resource "aws_route" "public_default" {
  count                  = var.internet_gateway_id != "" ? 1 : 0
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway_id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = merge(
    local.standard_tags,
    { Name = "${var.name_prefix}-${var.environment}-private-rt" }
  )
}

# Private Default Route (Optional NAT)
resource "aws_route" "private_default" {
  count                  = var.nat_gateway_id != "" ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}

# Optional: Subnet Association (only if subnets provided)
resource "aws_route_table_association" "public_assoc" {
  for_each       = { for subnet_id in var.public_subnet_ids : subnet_id => subnet_id }
  subnet_id      = each.value
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_assoc" {
  for_each       = { for subnet_id in var.private_subnet_ids : subnet_id => subnet_id }
  subnet_id      = each.value
  route_table_id = aws_route_table.private.id
}
