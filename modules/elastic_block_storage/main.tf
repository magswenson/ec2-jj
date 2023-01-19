
resource "aws_ebs_volume" "ebs_instance" {
  availability_zone = var.ebs_availability_zone
  size              = var.ebs_size
  type              = var.ebs_type
  iops              = var.ebs_iops
  tags = {
    Name = "ebs-${var.prefix}"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.ebs_instance.id
  instance_id = var.ebs_instance_id
}