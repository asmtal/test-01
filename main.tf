//--------------------------------------------------------------------
// Variables



//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/JoeStack/ec2-instance/aws"
  version = "1.13.0"

  ami = "ami-09351ab2e74aadeb2"
  instance_type = "t2.small"
  name = "foo"
  subnet_id = "${module.vpc.private_subnets[0]}"
  vpc_security_group_ids = "${module.vpc.default_security_group_id}"
}

module "vpc" {
  source  = "app.terraform.io/JoeStack/vpc/aws"
  version = "1.46.0"

  cidr = "10.0.0.0/16"
}
