provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
}

resource "aws-subnet" "public1" {
    vpc_id =aws_vpc_main.vpc_id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
}

resource "aws-subnet" "public2" {
    vpc_id =aws_vpc_main.vpc_id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc_main.id
  
}