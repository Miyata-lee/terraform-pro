provider "aws" {
  region = var.region
}

resource "aws_instance" "my_instance" {
  ami           = "ami-052064a798f08f0d3"
  instance_type = var.instance_type
  tags = {
    Name = "AMOO"
  }
}
resource "aws_s3_bucket" "storage" {
  bucket = "lee-fire-buck"
}
