resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ami.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnets.*.id[0]
  vpc_security_group_ids      = [aws_security_group.allow-ssh-bastion.id]
  associate_public_ip_address = true
  tags                        = {
          Name                = "bastion"
  }
}

resource "aws_security_group" "allow-ssh-bastion" {
  name        = "allow-ssh-bastion"
  description = "allow-ssh-bastion"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-bastion"
  }
}