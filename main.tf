

//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/JoeStack/ec2-instance/aws"
  version = "1.13.0"

  ami = "ami-09351ab2e74aadeb2"
  instance_type = "t2.small"
  name = "foo"
  subnet_id = "${module.vps2.private_subnet_ids[0]}"
  vpc_security_group_ids = "${module.vps2.bastion_security_group_id}"
}

module "vps2" {
  source  = "app.terraform.io/JoeStack/vps2/aws"
  version = "4.0.0"

  bastion_ami = "ami-09351ab2e74aadeb2"
  cidr_block = "10.0.0.0/16"
  key_name = "joestack"
}
