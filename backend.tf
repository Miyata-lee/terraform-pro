

# backend.tf
terraform {
  backend "s3" {
    bucket = "ninja-terraform-state"
    key    = "project/terraform.tfstate"
    region = "us-east-1"
  }
}
