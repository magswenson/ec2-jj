
module "vpc_prod" {
  source                  = "./modules/vpc"
  vpc_name                = "spoke-prod"
  private_subnet_name     = "spoke-mgmt_subnet"
  igw_name                = "spoke-mgmt_igw"
  vpc_cidr                = "10.2.0.0/16"
  cidr_private_subnet     = "10.2.10.0/24"
  map_public_ip_on_launch = true
}
module "windows_public_subnet" {
  source              = "./modules/public_subnets"
  aws_vpc_id          = module.vpc_prod.vpc_id
  public_subnet_name  = "windows-subnet"
  igw_name            = "windows_igw"
  internet_gateway_id = module.vpc_prod.aws_internet_gateway_id
  cidr_public_subnet  = "10.2.20.0/24"
  depends_on = [
    module.vpc_prod
  ]
}

module "security_group" {
  source         = "./modules/security_group"
  sg_vpc_id      = module.vpc_prod.vpc_id
  sg_name        = "geo_sg"
  sg_description = "HTTP, HTTPS and SSH traffic to geoserver"
}

module "security_group_rule-rdp" {
  source            = "./modules/security_group_rules"
  sg_rule_id        = module.security_group.security_group_id
  sg_rule_type      = "ingress"
  sg_from_rule_port = "3389"
  sg_to_rule_port   = "3389"
  sg_rule_protocol  = "tcp"
}

module "security_group_rule-output" {
  source            = "./modules/security_group_rules"
  sg_rule_id        = module.security_group.security_group_id
  sg_rule_type      = "egress"
  sg_from_rule_port = "0"
  sg_to_rule_port   = "65535"
  sg_rule_protocol  = "-1"
}

module "ec2" {
  source                      = "./modules/ec2"
  prefix                      = "geoserver"
  servers                     = 1
  ami_id                      = "ami-0c4cc0a40dd47b942"
  region                      = var.region_subnet
  subnet_id                   = module.windows_public_subnet.subnet_id
  security_group_id           = module.security_group.security_group_id
  associate_public_ip_address = true
  instance_type               = "t3.x2large"
}
module "elastic_block_storage" {
  source                = "./modules/elastic_block_storage"
  ebs_availability_zone = module.ec2.availability_zone[0]
  prefix                = "geo"
  ebs_size              = 120
  ebs_type              = "gp2"
  ebs_iops              = 0
  ebs_device_name       = "xvdh"
  ebs_instance_id       = module.ec2.instances_id[0]
}