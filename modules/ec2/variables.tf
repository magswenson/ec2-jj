variable "servers" {
  default = 1
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  default = ""
}

variable "security_group_id" {
}

variable "user_data" {
  default = ""
}

variable "prefix" {
  default = "webapp"
}

variable "associate_public_ip_address" {
  default = false
}

variable "ami_id" {
}

variable "region" {
}
