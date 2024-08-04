terraform {
  backend "s3" {
    bucket = "vamsi-s3-demo-xyz"
    key = "vamsi/terraform.tfstate" # subfolder inside S3
    region = "us-east-1" # S3 location
    encrypt = true
    dynamodb_table = "terraform_lock" #name of dynamoDB table
    
  }
}