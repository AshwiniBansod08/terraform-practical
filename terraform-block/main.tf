provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "new_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.new_security.id]

  user_data = base64encode(<<-EOF
           #!/bin/bash
           sudo apt update -y
           sudo apt install nginx -y
           sudo systemctl start nginx
           sudo systemctl enable nginx
           EOF
  )

}

resource "aws_security_group" "new_security" {
  name = "new_security"

  ingress {
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port  = 443
    to_port    = 443
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
