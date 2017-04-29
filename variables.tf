variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  description = "AWS region where proxy will be created"
}

variable "aws_instance_type" {
  description = "Instance type for the sshproxy (e.g. t2.micro)"
  default     = "t2.micro"
}

variable "ssh_public_key" {
  description = "SSH public key that can access the proxy (cat ~/.ssh/id_rsa.pub)"
}

variable "ssh_port" {
  default = 80
}
