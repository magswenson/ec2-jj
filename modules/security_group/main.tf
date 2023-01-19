resource "aws_security_group" "sg_intances" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.sg_vpc_id
}
