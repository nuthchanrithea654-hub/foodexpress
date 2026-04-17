provider "aws" {
  region = var.aws_region
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "foodexpress_sg" {
  name        = "foodexpress-sg-"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "App access on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "foodexpress_key" {
  key_name   = var.key_name
  public_key = file("${path.module}/${var.public_key_path}")
}

resource "aws_instance" "foodexpress_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.foodexpress_key.key_name
  vpc_security_group_ids = [aws_security_group.foodexpress_sg.id]
  user_data              = file("${path.module}/user_data.sh")

  tags = {
    Name = "FoodExpress-Server"
  }
}