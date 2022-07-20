variable "ami_id" {
  default = "ami-052efd3df9dad4825"
}

variable "instance_size" {
  default = "t2.micro"
}

variable "subnet" {
  default = "subnet-0585406403343a892"
}

variable "instance_name" {
  default = "evans-terraform"
}

variable "cidr_blocks" {
  default = "68.230.55.226"
}

variable "vpc_id" {
  default = "vpc-0d3dd930d8dfb97e3"
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