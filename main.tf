//--------------------------------------------------------------------
// Variables




//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/JoeStack/ec2-instance/aws"
  version = "1.13.0"

  ami = "ami-0f9cf087c1f27d9b1"
  instance_type = "t2.small"
  name = "ec2-foo"
  subnet_id = "${module.network.sn_private_a_id}"
  vpc_security_group_ids = ["${module.security_group.id}"]
}

module "network" {
  source  = "app.terraform.io/JoeStack/network/aws"
  version = "0.0.5"

  aws_region = "us-east-1"
  vpc_name = "vpc-foo"
}

module "security_group" {
  source  = "app.terraform.io/JoeStack/security-group/aws"
  version = "0.6"

  name = "sgfoo"
  vpc_id = "${module.network.vpc_id}"
}
