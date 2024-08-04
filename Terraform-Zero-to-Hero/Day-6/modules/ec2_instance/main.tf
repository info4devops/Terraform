provider "aws" {
  region = "us-east-1" 
}

variable "ami" {
  description = "This is AMI for instance"
}

variable "instance_type" {
  description = "This is instance type"
}

resource "aws_instance" "myEC2" {
  ami = var.ami
  instance_type = var.instance_type
}