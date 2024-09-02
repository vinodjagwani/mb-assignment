# modules/ec2/vars.tf

variable "public_subnet" {
  description = "The public subnet for SSM Host"
  type        =  string
  default     = "public_subnet"
}

variable "private_subnet" {
  description = "The private subnet for the server"
  type        =  string
  default     = "private_subnet"
}

variable "security_group_id" {
  description = "The security group ID for EC2 instances"
  type        = string
  default     = "security_group_id"
}

