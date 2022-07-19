provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "zebedee-test-terraform-remote-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  region  = "us-west-1"
}

resource "aws_instance" "ec2_in" {
  ami           = var.ami_id
  instance_type = var.instance_size
  subnet_id = var.subnet

  tags = {
    Name = var.instance_name
  }
}