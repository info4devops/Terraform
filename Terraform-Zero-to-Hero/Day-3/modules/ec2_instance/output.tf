# Output file

output "public-ip-address" {
  value = aws_instance.myEC2.public_ip # prints public IP of EC2
}