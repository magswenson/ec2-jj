variable "prefix" {
  default = "webapp"
}

variable "ebs_availability_zone" {
  default = "us-east-1"
}

variable "ebs_size" {
  default = 10
}

variable "ebs_type" {
  default = "gp2"
}

variable "ebs_iops" {
  default = "io1"
}

variable "ebs_device_name" {
  default = "/dev/sdh"
}

variable "ebs_instance_id" {
  default = "i-12345678"
}
