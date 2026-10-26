provider "aws" {
  region = "ap-south-1"
}

locals {
instance_name = "my-instance"
}

resource "aws_instance" "my" {
  ami                   = "ami-0c7632fb77f35db43"
  instance_type         = "t3.micro"
  key_name              = "private_key"
  vpc_security_group_ids = ["sg-06ee9ac2145d83633"]

  tags = {
  Name = local.instance_name
}
}


terraform {
  backend "s3" {
    bucket  = "new-ter-buckettt"
    key     = "terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
