provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_subnet.id
}


