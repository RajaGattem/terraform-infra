provider "aws" {
  region = var.region
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.vpc_cidr_block
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_instance" "my-instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI in us-east-1
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_subnet.id
}