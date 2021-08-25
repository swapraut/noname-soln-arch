terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_security_group" "noname_security_group" {
  name        = "Noname-security-group"
  description = "Allow HTTPS, SSH and Mirroring traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.noname_cidr]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.noname_cidr]
  }
  ingress {
    description = "AWS-Mirroring"
    from_port   = 4789
    to_port     = 4789
    protocol    = "udp"
    cidr_blocks = [var.noname_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.noname_cidr]
  }
  tags = {
    Name = "Noname-security-group"
  }
}

resource "aws_instance" "nonameservertf" {
  ami           = var.noname_ami_id
  instance_type = "m5.2xlarge"
  subnet_id = var.subnet_id
  security_groups = [
    aws_security_group.noname_security_group.id,
  ]
  source_dest_check = "false"
  tags = {
    Name = "Noname-Server-TF"
  }
  key_name = var.noname_key_name
}

resource "aws_eip" "Noname-TF" {
  vpc      = true
  instance = aws_instance.nonameservertf.id
  tags = {
    Name = "Noname-Server-TF-EIP"
  }
}
