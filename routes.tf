resource "aws_route_table" "public" {
  vpc_id              = aws_vpc.main.id
  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id        = aws_internet_gateway.igw.id
  }
  tags                = {
    Name              = "public-route-table"
    Environment       = var.ENV
  }
}

resource "aws_route_table_association" "public" {
  count               = length(aws_subnet.public-subnets.*.id)
  route_table_id      = aws_route_table.public.id
  subnet_id           = element(aws_subnet.public-subnets.*.id, count.index)
}

resource "aws_route_table" "private" {
  vpc_id              = aws_vpc.main.id
  route {
    cidr_block        = "0.0.0.0/0"
    nat_gateway_id    = aws_nat_gateway.ngw.id
  }
  tags                = {
    Name              = "private-route-table"
    Environment       = var.ENV
  }
}

resource "aws_route_table_association" "private" {
  count               = length(aws_subnet.private-subnets.*.id)
  route_table_id      = aws_route_table.private.id
  subnet_id           = element(aws_subnet.private-subnets.*.id, count.index)
}

