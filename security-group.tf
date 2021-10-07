resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress = [
    {
      description = "SSH from VPC"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "${var.cdirs_acesso_remoto}"
      ipv6_cidr_blocks : null
      prefix_list_ids : null
      self : null
      security_groups : null
    }
  ]

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"

  ingress = [
    {
      description = "HTTP from VPC"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "${var.cdirs_acesso_remoto}"
      ipv6_cidr_blocks : null
      prefix_list_ids : null
      self : null
      security_groups : null
    }
  ]

  egress = [
    {
      description      = "HTTP from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids : null
      self : null
      security_groups : null
    }
  ]

  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group" "allow_https" {
  name        = "allow_https"
  description = "Allow HTTPS inbound traffic"

  ingress = [
    {
      description = "HTTPS from VPC"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "${var.cdirs_acesso_remoto}"
      ipv6_cidr_blocks : null
      prefix_list_ids : null
      self : null
      security_groups : null
    }
  ]

  egress = [
    {
      description      = "HTTPS from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids : null
      self : null
      security_groups : null
    }
  ]

  tags = {
    Name = "allow_https"
  }
}

resource "aws_security_group" "allow_nifi" {
  name        = "allow_nifi"
  description = "Allow NIFI inbound traffic"

  ingress = [
    {
      description = "NIFI from VPC"
      from_port   = 8443
      to_port     = 8443
      protocol    = "tcp"
      cidr_blocks = "${var.cdirs_acesso_remoto}"
      ipv6_cidr_blocks : null
      prefix_list_ids : null
      self : null
      security_groups : null
    }
  ]

  egress = [
    {
      description      = "NIFI from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids : null
      self : null
      security_groups : null
    }
  ]

  tags = {
    Name = "allow_nifi"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id
}
