terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "= 3.54"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2-mp-bi-ops" {
  ami           = var.amis["us-east-1"]
  instance_type = var.instance_type["t2.micro"]
  # key_name      = "${var.key_name}"
  tags = {
    Name = "ec2-mp-bi-ops"
  }
  vpc_security_group_ids = [
    "${aws_default_security_group.default.id}",
    "${aws_security_group.allow_ssh.id}",
    "${aws_security_group.allow_http.id}",
    "${aws_security_group.allow_https.id}",
    "${aws_security_group.allow_nifi.id}"
  ]
  depends_on = [
    aws_db_instance.rds-mp-bi-ops
  ]
}

resource "aws_db_instance" "rds-mp-bi-ops" {
  allocated_storage   = 10
  engine              = "postgres"
  engine_version      = "13.3"
  instance_class      = "db.t3.micro"
  name                = "rdsmpbiops"
  username            = "biopsAdmin"
  password            = "e&u8dI6pMDmB"
  skip_final_snapshot = true
  vpc_security_group_ids = [
    "${aws_default_security_group.default.id}"
  ]
}
