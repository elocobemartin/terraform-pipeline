provider "aws" {
  region = "us-east-1"
}

# EC2 instances
resource "aws_instance" "web" { 
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro" 

  tags = { 
    Name = "web-server-${count.index}" 
  }
}

# Output the public IPs of the instances
output "instance_public_ips" {
  value = aws_instance.web[*].public_ip
}
