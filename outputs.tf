output "instance_id" {
  value = aws_instance.my_instance.id
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.storage.bucket
}