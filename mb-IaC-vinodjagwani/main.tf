# main.tf

provider "aws" {
  region     = var.aws_region
  access_key = "access_key"
  secret_key = "secret_key"
}

module "vpc" {
  source = "./modules/vpc"
}

module "rds" {
  source = "./modules/rds"
  private_subnets = module.vpc.private_subnets
}

module "ec2" {
  source = "./modules/ec2"
  public_subnet = module.vpc.public_subnets[0]
}

module "s3" {
  source = "./modules/s3"
}

module "cloudfront" {
  source = "./modules/cloudfront"
}

