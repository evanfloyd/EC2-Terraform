variable "ami_id" {
  default = "ami-052efd3df9dad4825"
}

variable "instance_size" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "evans-terraform"
}

variable "security_groups" {
  default = "evans_sg"
}

variable "cidr_block" {
  default = "172.31.0.0/16"
}

variable "availability_zone" {
  default = "us-east-1c"
}

variable "size" {
  default = "8"
}

variable "name" {
  default = "evans_volume"
}

variable "device_name" {
  default = "/dev/sdh"
}

variable "key_name" {
  default = "evans-key"
}