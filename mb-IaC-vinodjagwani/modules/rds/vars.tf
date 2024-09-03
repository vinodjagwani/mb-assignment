# modules/rds/vars.tf

variable "private_subnets" {
  description = "The private subnets for RDS"
  type        = list(string)
  default     = ["198.168.0.0/24", "198.168.255.0/24"]
}

variable "security_group_id" {
  description = "The security group ID for RDS"
  type        =  string
  default     = "security_group_id"
}

variable "vpc_id" {
  description = "vpc id"
  type        =  string
}

