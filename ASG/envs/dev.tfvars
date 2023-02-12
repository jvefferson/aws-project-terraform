region           = "us-east-1"
name_prefix      = "foobar"
image_id         = "ami-0aa7d40eeae50c9a9"
instance_type    = "t2.micro"
desired_capacity = 1
max_size         = 99
min_size         = 1
subnets          = ["subnet-0c863859adb576341"]
tags = {
  Name = "main"
}