resource "aws_internet_gateway" "igw" {
  vpc_id              = aws_vpc.main.id
}

resource "aws_eip" "nat" {
  vpc      = true
}


resource "aws_nat_gateway" "ngw" {
  allocation_id       = aws_eip.nat.id
  subnet_id           = element(aws_subnet.public-subnets.*.id, 1)
}