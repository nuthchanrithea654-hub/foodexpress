output "ec2_public_ip" {
  value = aws_instance.foodexpress_ec2.public_ip
}