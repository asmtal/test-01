//--------------------------------------------------------------------
// Variables



//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/JoeStack/ec2-instance/aws"
  version = "1.13.0"

  ami = "ami-09351ab2e74aadeb2"
  instance_type = "t2.small"
  name = "test"
  subnet_id = "${module.vpc2.private_subnet_ids}"
  vpc_security_group_ids = "${module.vpc2.bastion_security_group_id}"
}

module "vpc2" {
  source  = "app.terraform.io/JoeStack/vpc2/aws"
  version = "4.0.0"

  bastion_ami = "ami-09351ab2e74aadeb2"
  key_name = "joestack"
}
