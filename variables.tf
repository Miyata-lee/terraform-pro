variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "subnet_id" {
    type = string
}

variable "sg_name" {
  description = "Security Group Name"
  type        = string
}
variable "key_name" {
  
}