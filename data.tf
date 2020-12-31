data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ami" {
  owners            = ["973714476881"] // No need to change this here
  most_recent       = true
  name_regex        = "^Centos-7-DevOps-Practice"
}