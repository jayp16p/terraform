resource "aws_vpc" "jay" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vprofile"
  }
}

resource "aws_subnet" "jay-pub-1" {
  vpc_id                  = aws_vpc.jay.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "jay-pub-1"
  }
}

resource "aws_subnet" "jay-pub-2" {
  vpc_id                  = aws_vpc.jay.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "jay-pub-2"
  }
}

resource "aws_subnet" "jay-priv-1" {
  vpc_id                  = aws_vpc.jay.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "jay-priv-1"
  }
}

resource "aws_subnet" "jay-priv-2" {
  vpc_id                  = aws_vpc.jay.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "jay-priv-2"
  }
}

resource "aws_internet_gateway" "jay-IGW" {
  vpc_id = aws_vpc.jay.id
  tags = {
    Name = "jay-IGW"
  }
}

resource "aws_route_table" "jay-pub-RT" {
  vpc_id = aws_vpc.jay.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jay-IGW.id
  }

  tags = {
    Name = "jay-pub-RT"
  }
}

resource "aws_route_table_association" "jay-pub-1-a" {
  subnet_id      = aws_subnet.jay-pub-1.id
  route_table_id = aws_route_table.jay-pub-RT.id
}

resource "aws_route_table_association" "jay-pub-2-a" {
  subnet_id      = aws_subnet.jay-pub-2.id
  route_table_id = aws_route_table.jay-pub-RT.id
}