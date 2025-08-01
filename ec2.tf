provider "aws" {
  region = "us-west-1"
}
# EC2 instances
resource "aws_instance" "ec2-instance" {
  count         = 3
  ami           = "ami-020cba7c55df1f615" 
  instance_type = "t2.micro"
  tags = {
    Name = "MyEC2Instance-${count.index + 1}"
  }
}
# output the public Ips of the instance
  output "instance_public_ips" {
    value=aws_instance.ec2-instance[*].public_ip
  }