provider "aws" {
  region = "ap-south-1"
}

locals {
  instance_name = "my-instance"
}

resource "aws_instance" "demo" {
  ami           = "ami-0c7632fb77f35db43"
  instance_type = var.instance_type

  tags = {
    Name = local.instance_name
  }
}

variable "instance_type" {
  default = "t3.micro"
}

output "instance_id" {
  value = aws_instance.demo.id
}

output "public_ip" {
  value = aws_instance.demo.public_ip
}
