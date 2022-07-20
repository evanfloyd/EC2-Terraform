provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_in" {
  ami           = var.ami_id
  instance_type = var.instance_size
  subnet_id = var.subnet

  user_data = "${file("install_docker.sh")}"


  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "evans_eip" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.myeip.id
}

resource "aws_security_group" "evans_sg" {
	  name        = "evans-security-group"

	  ingress {
	    from_port   = 443
	    to_port     = 443
	    protocol    = "tcp"
      cidr_blocks = [68.230.55.226/32] 
	  }
      egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
	}
