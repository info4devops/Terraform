provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "This is AMI for instance"  
}

variable "instance_type" {
  description = "This is instance type"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}

module "ec2_instance" {
  source = "./modules/ec2_instance" # Module path
  ami= var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}