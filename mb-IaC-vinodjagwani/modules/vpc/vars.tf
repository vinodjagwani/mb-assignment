# modules/vpc/vars.tf

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "public_subnets" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["192.168.0.0/24", "192.168.100.0/24"]
}

variable "private_subnets" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["192.168.101.0/24", "192.168.255.0/24"]
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1d", "us-east-1a"]
  description = "A list of availability zones where resources will be deployed"
}


