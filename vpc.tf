resource "aws_vpc" "polin_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "polin-vpc"
  }
}

resource "aws_subnet" "polin_subnet" {
  vpc_id            = aws_vpc.polin_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "polin-subnet-us-west-2a"
  }
}

resource "aws_subnet" "polin_subnet2" {
  vpc_id            = aws_vpc.polin_vpc.id
  cidr_block        = "172.16.11.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "polin-subnet-us-west-2b"
  }
}

resource "aws_subnet" "polin_subnet3" {
  vpc_id            = aws_vpc.polin_vpc.id
  cidr_block        = "172.16.12.0/24"
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "polin-subnet-us-west-2c"
  }
}

resource "aws_internet_gateway" "polin_gw" {
  vpc_id = aws_vpc.polin_vpc.id

  tags = {
    Name = "polin-gw"
  }
}

resource "aws_route" "polin_rt" {
  route_table_id = aws_vpc.polin_vpc.default_route_table_id
  gateway_id = aws_internet_gateway.polin_gw.id
  destination_cidr_block = "0.0.0.0/0"
}
