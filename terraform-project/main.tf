provider "aws" {
  region = "us-west-1"  # Specify your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0f8e81a3da6e2510a"  # Specify your desired Ubuntu AMI ID
  instance_type = "t2.micro"  # Specify your desired instance type
  subnet_id     = "subnet-011c383caa2d1d1dc"  # Specify your desired subnet ID
  key_name      = "my-ssh-key"  # Use the correct key pair name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install docker.io -y
              sudo systemctl enable docker
              sudo systemctl start docker
              EOF

  tags = {
    Name = "GRUPA2_9_1_EC2 Instance"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}
