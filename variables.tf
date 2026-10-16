
variable "vpc" {
  type    = string
  default = "vpc-0bad9a866461a5c36"
}

variable "public_subnet" {
  type    = string
  default = "subnet-0029762956b468b44"
}

variable "private_subnet" {
  type    = string
  default = "subnet-0e14f10056f3b57f4"
}

data "aws_instance" "public_instance" {
  instance_id = "i-0603b6a08cfed56b9"
}

data "aws_instance" "private_instance" {
  instance_id = "i-0ab46251042441cf8"
}