variable "key_name" {
  description = "my-ssh-key"
}

variable "subnet_id" {
  description = "subnet-06a2426b6706fb686"
}

variable "vpc_id" {
  description = "vpc-0f488eb699cfd3961"
}

variable "private_key_path" {
  description = "/Users/sandris/.ssh/"
}

module "production" {
  source = "./environments/production"
}
