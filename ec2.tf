provider "aws" {
  region = var.region 
}
# EC2 instances
resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "MyEC2Instance-${count.index + 1}"
  }
}
# output the public Ips of the instance
  output "instance_public_ips" {
    value=aws_instance.example[*].public_ip
  }