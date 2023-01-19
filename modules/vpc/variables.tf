variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "instance_vpc"
}

variable "cidr_private_subnet" {
  default = "10.0.1.0/24"
}

variable "private_subnet_name" {
  default = "instace_subnet"
}

variable "igw_name" {
  default = "instance_igw"
}

variable "map_public_ip_on_launch" {
  default = false
}

variable "enable_dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true
}
