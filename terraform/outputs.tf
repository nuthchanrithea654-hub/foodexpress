output "ec2_public_ip" {
  value = aws_instance.foodexpress_ec2.public_ip
}

output "ecr_repository_url" {
  value = aws_ecr_repository.foodexpress_repo.repository_url
}