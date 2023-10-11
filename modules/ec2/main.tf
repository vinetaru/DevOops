provider "aws" {
  region = "us-west-1" # Mainiet reģionu, ja nepieciešams
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.large"
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  tags = {
    Name = "example-instance"
  }

  security_groups = [aws_security_group.example_sg.name]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}

resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Example security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "key_name" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "private_key_path" {}
