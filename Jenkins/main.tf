
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "mygateway"
  }
}

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"   #everything should connect
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "RT"
  }
}

#subnet association
resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.routetable.id
}

resource "aws_route_table_association" "association1" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.routetable.id
}

resource "aws_security_group" "websg" {
  name        = "websg"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
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
    Name = "web-sg"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.websg.id]
  subnet_id = aws_subnet.subnet1.id
  user_data = base64encode(file("instalation.sh"))
}


