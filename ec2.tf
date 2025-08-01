provider "aws" {
  region = "us-east-1"
}
# EC2 instances
resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-020cba7c55df1f615" 
  instance_type = "t2.micro"
  tags = {
    Name = "MyEC2Instance-${count.index + 1}"
  }
}
# output the public Ips of the instance
  output "instance_public_ips" {
    value=aws_instance.example[*].public_ip
  }