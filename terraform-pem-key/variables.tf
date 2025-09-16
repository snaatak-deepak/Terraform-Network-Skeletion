#>>>>>>>>>>>>>>>>>>>VPC-VARIABLES>>>>>>>>>>>>>>>>>>>>>>>>>>>

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_enable_dns_support" {
  type    = bool
  default = true
}

variable "vpc_enable_dns_hostnames"{
  type    = bool
  default = true
}

variable "vpc_tags" {
  type    = map(string)
  default = {
    Name        = "dev-vpc"
    Enviroment  = "dev"
    Owner       = "abhishek"
  }
}

#>>>>>>>>>>>>>>>>>>>SSH-KEY-VARIABLE>>>>>>>>>>>>>>>>>>>>>>>>>>>
variable "ssh_key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
  default     = "dev-otms-cloudops-1"
}

