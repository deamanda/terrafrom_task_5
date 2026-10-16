resource "aws_security_group" "ssh_security_group" {
  name   = var.ssh_sg
  vpc_id = var.vpc

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Project = "cmtr-otuokx4e"
  }
}


resource "aws_security_group" "public_http_security_group" {
  name   = var.public_http_sg
  vpc_id = var.vpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Project = "cmtr-otuokx4e"
  }
}

resource "aws_security_group" "private_http_security_group" {
  name   = var.private_http_sg
  vpc_id = var.vpc
  ingress {
    security_groups = [aws_security_group.public_http_security_group.id]
    from_port       = 8080
    protocol        = "tcp"
    to_port         = 8080
  }
  ingress {
    security_groups = [aws_security_group.public_http_security_group.id]
    protocol        = "-1"
    from_port       = 0
    to_port         = 0
  }
  tags = {
    Project = "cmtr-otuokx4e"
  }
}

resource "aws_network_interface_sg_attachment" "ssh_security_public_subnet_attachment" {
  security_group_id    = aws_security_group.ssh_security_group.id
  network_interface_id = data.aws_instance.public_instance.network_interface_id
}

resource "aws_network_interface_sg_attachment" "public_http_public_subnet_attachment" {
  security_group_id    = aws_security_group.public_http_security_group.id
  network_interface_id = data.aws_instance.public_instance.network_interface_id
}

resource "aws_network_interface_sg_attachment" "ssh_security_private_subnet_attachment" {
  security_group_id    = aws_security_group.ssh_security_group.id
  network_interface_id = data.aws_instance.private_instance.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_http_security_group_attachment" {
  security_group_id    = aws_security_group.private_http_security_group.id
  network_interface_id = data.aws_instance.private_instance.network_interface_id
}