data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "tls_private_key" "key_length" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "private_key" {
  key_name   = "${var.prefix}_key"
  public_key = tls_private_key.key_length.public_key_openssh
}

resource "aws_instance" "instance_ec2" {
  count                       = var.servers
  ami                         = var.ami_id == "" ? data.aws_ami.amazon_linux.id : var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = ["${var.security_group_id}"]
  key_name                    = aws_key_pair.private_key.key_name
  user_data                   = var.user_data == "" ? null : file("${var.user_data}")
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
  Name = "${var.prefix}-${count.index + 1}" }
}
