variable "allowed_ip_range" {}

variable "vpc" {
  type        = string
  description = "vpc id"
  default     = "vpc-0bad9a866461a5c36"
}

variable "public_subnet" {
  type        = string
  description = "public subnet"
  default     = "subnet-0029762956b468b44"
}

variable "private_subnet" {
  type        = string
  description = "private subnet"
  default     = "subnet-0e14f10056f3b57f4"
}

variable "ssh_sg" {
  type        = string
  description = "SSH Security Group name"
  default     = "cmtr-otuokx4e-ssh-sg"
}

variable "public_http_sg" {
  type        = string
  description = "Public HTTP Security Group"
  default     = "cmtr-otuokx4e-public-http-sg"
}

variable "private_http_sg" {
  type        = string
  description = "Private HTTP Security Group name"
  default     = "cmtr-otuokx4e-private-http-sg"
}

data "aws_instance" "public_instance" {
  instance_id = "i-0603b6a08cfed56b9"
}

data "aws_instance" "private_instance" {
  instance_id = "i-0ab46251042441cf8"
}