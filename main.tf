provider "aws" {
  region = var.aws_region
}

# EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-052064a798f08f0d3"  # change to your region's valid AMI
  instance_type = var.instance_type
  subnet_id     = var.subnet_id            # ✅ use subnet instead of vpc_id
  associate_public_ip_address = true

  tags = {
    Name = "${terraform.workspace}-instance"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = terraform.workspace
    Name        = "Terraform-S3"
  }
}

# Security Group
resource "aws_security_group" "example_sg" {
  name        = var.sg_name
  description = "Allow SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
