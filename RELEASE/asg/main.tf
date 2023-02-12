# Pulls outputs of VPC from S3
data "terraform_remote_state" "main" {
  backend = "s3"
  config = {
    bucket = "terraform-backend-for-release"
    key    = "us-east-1/vpc"
    region = "us-east-1"
  }
}

# Prints outputs from S3
output "full_list" {
    value = data.terraform_remote_state.main.outputs.*
}

module asg {
    source = "jvefferson/asgroup/aws"
    region           = "us-east-1"
    name_prefix      = "foobar"
    image_id         = "ami-0aa7d40eeae50c9a9"
    instance_type    = "t2.micro"
    desired_capacity = 1
    max_size         = 99
    min_size         = 1
    subnets          = [
        data.terraform_remote_state.main.outputs.public_subnet1,
        data.terraform_remote_state.main.outputs.public_subnet2,
        data.terraform_remote_state.main.outputs.public_subnet3,
    ]
    tags = {
    Name = "main"
    }
}

### Terraform init and apply