provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_in" {
  ami           = var.ami_id
  instance_type = var.instance_size
  subnet_id = var.subnet
  key_name = var.key_name

  user_data = "${file("install_docker.sh")}"


  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "evans_eip" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_in.id
  allocation_id = aws_eip.evans_eip.id
}

resource "aws_security_group" "evans_sg" {
	  name        = "evans-security-group"
    vpc_id      = var.vpc_id

	  ingress {
	    from_port   = 443
	    to_port     = 443
	    protocol    = "tcp"
      cidr_blocks      = [aws_vpc.main.cidr_block]
      ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
	  }
      egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
	}

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