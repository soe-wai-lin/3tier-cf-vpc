resource "aws_eip" "nat_eip" {
  domain = "vpc"
}


resource "aws_nat_gateway" "terra_natgw" {
  subnet_id     = aws_subnet.terra_vpc_pub_01.id
  allocation_id = aws_eip.nat_eip.id

  tags = {
    Name = "terra-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.terra_igw]
}