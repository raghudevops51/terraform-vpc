output "VPC_ID" {
  value = aws_vpc.main.id
}

output "VPC_CIDR" {
  value = aws_vpc.main.cidr_block
}

output "PRIVATE_SUBNETS" {
  value = aws_subnet.private-subnets.*.id
}

output "PUBLIC_SUBNETS" {
  value = aws_subnet.public-subnets.*.id
}

output "PUBLIC_CIDRS" {
  value = aws_subnet.public-subnets.*.cidr_block
}

output "PRIVATE_CIDRS" {
  value = aws_subnet.private-subnets.*.cidr_block
}

output "HOSTED_ZONE_ID" {
  value = var.HOSTED_ZONE_ID
}
