resource "aws_ebs_volume" "evans_volume" {
  availability_zone = var.availability_zone
  size              = var.size

  tags = {
    Name = var.name
  }
}

resource "aws_volume_attachment" "volume_attach" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.evans_volume.id
  instance_id = aws_instance.ec2_in.id
}