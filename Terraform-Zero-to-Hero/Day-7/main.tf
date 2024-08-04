# We will use the Secret created in Hashicorp vault as tag to EC2 instance same will be created by using terraform

provider "aws" {
  region = "us-east-1"
  
}

# Provide vault details

provider "vault" {
  address = "http://107.23.37.246:8200" # EC2 instance ID where vault is configured
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "42865345-82fe-3f92-5ebc-760209df9071"
      secret_id = "de07fc47-ef24-41f1-7d15-67f61b1cb260"
    }
  }
  
}

# Retrive the secret details from vault

data "vault_kv_secret_v2" "example" {
  mount = "kv" # path of secret in vault
  name = "test-secret" # secret name
  
}

# Create EC2
resource "aws_instance" "myEC2" {
  ami= "ami-080e1f13689e07408" # Specify an appropriate AMI ID
  instance_type = "t2.micro"

  # attach the secret value as a tag to EC2
  tags = {

    # To get value assosicated to username key
    secret= data.vault_kv_secret_v2.example.data["username"] 
  }
}


