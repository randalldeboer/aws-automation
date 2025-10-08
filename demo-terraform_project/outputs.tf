# outputs.tf
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

output "web_instance_public_ip" {
  value = aws_instance.web.public_ip
}