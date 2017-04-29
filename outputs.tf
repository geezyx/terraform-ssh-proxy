output "Instructions" {
  value = <<EOF

--------------------------------------------------------------------------------

Connect to the sshproxy instance with the following command:
ssh ubuntu@${aws_instance.sshproxy.public_ip} -p ${var.ssh_port} -D 8080

Configure your browser or OS to use a SOCKS proxy, pointing to 127.0.0.1:8080

You should be able to google "what is my ip" and
see ${aws_instance.sshproxy.public_ip} as the result.

Your web traffic is now being proxied through AWS!

When you are finished, you can leave the instance running,
or use "terraform destroy" to remove it.

--------------------------------------------------------------------------------

EOF
}
