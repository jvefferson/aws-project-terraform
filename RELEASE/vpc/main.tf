module "vpc" {
  source  = "farrukh90/vpc/aws"
  region = "us-east-1"
  vpc_cidr = "10.0.0.0/16"
  public_cidr1 = "10.0.1.0/24"
  public_cidr2 = "10.0.2.0/24"
  public_cidr3 = "10.0.3.0/24"
  tags    =   {
    Name                    =   "Project"
    Environment             =   "Dev"
    Team                    =   "DevOps"
    Created_by              =   "Terraform"
   }
}

output "vpc" {
  value = module.vpc.vpc
}
output "public_subnet1" {
  value = module.vpc.public_subnets[0]
}


output "public_subnet2" {
  value = module.vpc.public_subnets[1]
}

output "public_subnet3" {
  value = module.vpc.public_subnets[2]
}

output "region" {
  value = module.vpc.region
}

### Terraform init and apply