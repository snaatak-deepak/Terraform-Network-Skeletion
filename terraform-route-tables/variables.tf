variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name (dev/qa/prod)"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "application" {
  type = string
}

variable "owner" {
  type = string
}

variable "cost_center" {
  type = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where route tables will be created"
}

variable "internet_gateway_id" {
  type        = string
  default     = ""
  description = "Internet Gateway ID (optional)"
}

variable "nat_gateway_id" {
  type        = string
  default     = ""
  description = "NAT Gateway ID (optional)"
}

variable "public_subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of public subnets (optional)"
}

variable "private_subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of private subnets (optional)"
}
