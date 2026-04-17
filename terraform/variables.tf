variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0e86e20dae9224db8"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "foodexpress-key-v5"
}

variable "public_key_path" {
  default = "foodexpress-key.pub"
}

variable "my_ip" {
  type = string
}