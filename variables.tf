variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
}

