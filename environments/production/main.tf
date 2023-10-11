module "ec2_instance" {
  source = "../../modules/ec2"

  key_name        = my-ssh-key
  subnet_id       = subnet-06a2426b6706fb686
  vpc_id          = vpc-0f488eb699cfd3961
  private_key_path = "/Users/sandris/.ssh/my-ssh-key.pem"
}
