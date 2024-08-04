#Provider

provider "aws" {
  region = "us-east-1" # region name
}

# To create EC2-Instance

resource "aws_instance" "myEC2" {
    ami_value = "ami-080e1f13689e07408" 
    instance_type_value ="t2.micro"  
    subnet_id_value ="subnet-08c165d15c9e699db"
    key_name ="mytest"
}

# To create S3 bucket - To store state file

resource "aws_s3_bucket" "my-S3-bucket" {
  bucket = "vamsi-s3-demo-xyz" # name of the S3 it should be unique
  
}

# To create DynamoDB - for terraform lock

resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  
}
