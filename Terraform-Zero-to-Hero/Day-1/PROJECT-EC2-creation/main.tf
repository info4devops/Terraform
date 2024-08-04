# This script is to create EC2 instance with basic configuration

provider "aws" {
  region = "us-east-1" #set your desired AWS region
    
}

resource "aws_instance" "Example-EC2" {
  ami= "ami-080e1f13689e07408" # Specify an appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id = "subnet-08c165d15c9e699db" # specify the subnet ID
  key_name = "mytest" # Specify the key-value pair
  tags = {
    Name = "ExampleAppServerInstance"

}

