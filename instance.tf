data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "sshproxy" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.aws_instance_type}"
  security_groups = ["${aws_security_group.sshproxy.name}"]

  user_data = <<EOF
#cloud-config
apt_upgrade: true
ssh_authorized_keys:
  - "${var.ssh_public_key}"
runcmd:
  - "sed -i 's/Port 22/Port ${var.ssh_port}/' /etc/ssh/sshd_config"
  - "service ssh restart"
EOF

  tags {
    Name = "sshproxy"
  }
}
