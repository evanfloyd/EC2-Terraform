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
