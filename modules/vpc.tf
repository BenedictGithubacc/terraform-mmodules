

#vpc block
resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  tags = {
    Name = "main"
  }
}
#public subnet 1
resource "aws_subnet" "pub-sub-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub1_cidr_block
  availability_zone = var.pub1_availability_zone

  tags = {
    Name = "pub-sub-1"
  }
}
#public subnet 2
resource "aws_subnet" "pub-sub-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub2_cidr_block
  availability_zone = var.pub2_availability_zone

  tags = {
    Name = "pub-sub-2"
  }
}
#private subnet 1
resource "aws_subnet" "pvt-sub-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pvt1_cidr_block
  availability_zone = var.pvt1_availability_zone

  tags = {
    Name = "pvt-sub-1"
  }
}
#private subnet 2
resource "aws_subnet" "pvt-sub-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pvt2_cidr_block
  availability_zone = var.pvt2_availability_zone

  tags = {
    Name = "pvt-sub-2"
  }
}
#internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}
#eip-1
resource "aws_eip" "eip-1" {
  vpc      = true
}
#eip-2
resource "aws_eip" "eip-2" {
  vpc      = true
}
#natgateway 1
resource "aws_nat_gateway" "nat-1" {
  allocation_id = aws_eip.eip-1.id 
  subnet_id     = aws_subnet.pub-sub-1.id 

  tags = {
    Name = "gw NAT-1"
  }
}
#natgateway 2
resource "aws_nat_gateway" "nat-2" {
  allocation_id = aws_eip.eip-2.id
  subnet_id     = aws_subnet.pub-sub-2.id 

  tags = {
    Name = "gw NAT-2"
  }
}
#public route table 1
resource "aws_route_table" "pub-rt-1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "pub-rt-"
  }
}
#public route table 2
resource "aws_route_table" "pub-rt-2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "pub-rt-"
  }
}
#private route table 1
resource "aws_route_table" "pvt-rt-1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-1.id 
  }

  tags = {
    Name = "pvt-rt-1"
  }
}
#private route table 2
resource "aws_route_table" "pvt-rt-2" {
  vpc_id = aws_vpc.main.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-2.id
  }

  tags = {
    Name = "pvt-rt-2"
  }
}
#public rpute table association 1
resource "aws_route_table_association" "pub-rt-ass-1" {
  subnet_id      = aws_subnet.pub-sub-1.id 
  route_table_id = aws_route_table.pub-rt-1.id 
}
#public route table association 2
resource "aws_route_table_association" "pub-rt-ass-2" {
  subnet_id      = aws_subnet.pub-sub-2.id 
  route_table_id = aws_route_table.pub-rt-2.id 
}
#private route table 1 association
resource "aws_route_table_association" "pvt-rt-ass-1" {
  subnet_id      = aws_subnet.pvt-sub-1.id
  route_table_id = aws_route_table.pvt-rt-1.id
}
#private route table 2 association
resource "aws_route_table_association" "pvt-rt-ass-2" {
  subnet_id      = aws_subnet.pvt-sub-2.id
  route_table_id = aws_route_table.pvt-rt-2.id
}
resource "aws_security_group" "public-sg" {
  name        = "pub-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "ssh"
    from_port        = var.pub-sg-ssh
    to_port          = var.pub-sg-ssh
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    description      = "http"
    from_port        = var.pub-sg-http
    to_port          = var.pub-sg-http
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-sg"
  }
}
resource "aws_security_group" "private-sg" {
  name        = "pvt-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.public-sg.id]
    
  }
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.public-sg.id]
  }
  ingress {
    description      = "mysql"
    from_port        = var.pvt-sg-mysql
    to_port          = var.pvt-sg-mysql
    protocol         = "tcp"
    security_groups  = [aws_security_group.public-sg.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}

