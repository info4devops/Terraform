#Provider
provider "aws" {
  region = "us-east-1"
}

# Module details
module "ec2_instance" {
  source = "./modules/ec2_instance" # path of the module
  ami_value = "ami-080e1f13689e07408"
  instance_type_value ="t2.micro"
  subnet_id_value ="subnet-08c165d15c9e699db"
  key_name ="mytest"
  
}