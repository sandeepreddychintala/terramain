provider "aws" {
  region = "${var.region}"
}

module "vpc" {
    source = "./VPC"
    
}

module "ec2" {
    source = "./EC2"
    vpc_id = "${module.vpc.vpc-id}"
    public_subnet_ids = "${module.vpc.public_subnet_ids}"
    private_subnet_ids = "${module.vpc.private_subnet_ids}"
}