//--------------------------------------------------------------------
// Modules
module "vpc" {
  source  = "app.terraform.io/JoeStack/vpc/aws"
  version = "1.46.0"

  cidr = "10.0.0.0/8"
}
