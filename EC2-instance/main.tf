module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  ami                    = "ami-0ca285d4c2cda3300"
  instance_type          = "t2.nano"
  key_name               = "nomad"
  monitoring             = false
  vpc_security_group_ids = ["sg-0cf03168198b87d42"]
  subnet_id              = "subnet-0357bbe188bd1e4c8"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}