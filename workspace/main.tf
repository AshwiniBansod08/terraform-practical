provider "aws" {
    region ="ap-south-1"
}

resource "aws_instance" "new_instance" {
    ami = "ami-07a00cf47dbbc844c"
    instance_type = "t3.micro"
    key_name = "private-key"

    tags = {
        Name = terraform.workspace
    }
}
