variable "amis" {
  type = map(string)

  default = {
    "us-east-1" = "ami-07d0cf3af28718ef8"
  }
}

variable "instance_type" {
  type = map(string)

  default = {
    "t2.micro" = "t2.micro",
    "m4.xlarge" = "m4.xlarge"
  }
}

variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "key_name" {
  type    = string
  default = "terraform-aws"
}

variable "vpc" {
  type = map(string)

  default = {
    "vpc-mp-bi-ops" = "vpc-05f3cf1463d0541cb"
  }
}