terraform {
  backend "s3" {
    bucket = "terraform-backend-for-release"
    key    = "us-east-1/vpc"
    region = "us-east-1"
  }
}