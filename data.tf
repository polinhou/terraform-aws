data "aws_subnets" "polin_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.polin_vpc.id]
  }

  depends_on = [
    aws_subnet.polin_subnet,
    aws_subnet.polin_subnet2,
    aws_subnet.polin_subnet3
  ]
}
