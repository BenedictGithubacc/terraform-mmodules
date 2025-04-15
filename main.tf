
#vpc modules
 module "vpc-main" {
    source = "./modules"
    region = var.aws_region
    cidr_block = var.cidr_block
    pub1_cidr_block = var.pub1_cidr_block
    pub1_availability_zone = var.pub1_availaibility_zone
    pub2_cidr_block = var.pub2_cidr_block
    pub2_availability_zone = var.pub2_availability_zone
    pvt1_cidr_block = var.pvt1_cidr_block
    pvt1_availability_zone = var.pvt1_availability_zone
    pvt2_cidr_block = var.pvt2_cidr_block
    pvt2_availability_zone = var.pvt2_availability_zone
    pub-sg-ssh = var.pub_sg_ssh
    pub-sg-http = var.pub_sg_http
    pvt-sg-mysql = var.pvt_sg_mysql
 }

 #Ec2 modules
  module "ec2" {
    source = "./modules1"
    aws_ami = var.aws_ami
    instance_type = var.instance_type
    availability_zone1 = var.availability_zone1
    availability_zone2 = var.availability_zone2
    pub1_subnet_id = module.vpc-main.aws_public_subnet_1
    aws_public_sg = module.vpc-main.public_securitygroup
    pub2_subnet_id = module.vpc-main.public_subnet_2
  }

  #db modules
  module "db" {
    source = "./modules2"
    instance_class = var.instance_class
    availability_zone = var.availability_zone1
    private_sg = module.vpc-main.private_securitygroup
    pvt1_subnet = module.vpc-main.private_subnet_1
    pvt2_subnet = module.vpc-main.private_subnet_2
    
  }

  #lb modules
  module "lb" {
    source = "./modules3"
    load_bakancer_type = var.lb_types
    security_groups = module.vpc-main.public_securitygroup
    pub1_subnet = module.vpc-main.aws_public_subnet_1
    pub2_subnet = module.vpc-main.public_subnet_2
    aws_vpc = module.vpc-main.aws_vpc
    aws_instance1 = module.ec2.aws_instance1
    aws_instance2 = module.ec2.aws_instance2
  }