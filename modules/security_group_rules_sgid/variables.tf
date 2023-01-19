variable "sg_rule_id" {
  default = "sg-12345678"
}

variable "sg_rule_type" {
  default = "ingress"
}

variable "sg_from_rule_port" {
  default = "80"
}

variable "sg_to_rule_port" {
  default = "80"
}

variable "sg_rule_protocol" {
  default = "tcp"
}

variable "source_security_group_id" {
  default = "sg-12345678"
}
