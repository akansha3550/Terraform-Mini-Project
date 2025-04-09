# Web Server (Public)
resource "aws_instance" "web" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "Web-Server"
  }
}

# App Server (Private)
resource "aws_instance" "app" {
  ami             = "ami-084568db4383264d4"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.app_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "App-Server"
  }
}

# Database Server (Private)
resource "aws_instance" "db" {
  ami             = "ami-084568db4383264d4"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.db_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]


  tags = {
    Name = "DB-Server"
  }
}