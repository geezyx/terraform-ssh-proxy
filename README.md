## SSH Proxy in AWS using Terraform

A simple ubuntu server deployment in AWS for use as an SSH reverse proxy.

### How to use

You should be able to follow these instructions on any platform, but setting up an SSH key and using the proxy is a bit more complicated on windows.  There are some additional resources for windows [in the docs folder](docs/WINDOWS.md).

1. Download terraform - https://www.terraform.io/downloads.html

1. Create an AWS account if you don't have one already (You can run a t2.micro instance
 for free for a year).

1. Create a user with the `AmazonEC2FullAccess` policy, save your access key ID and secret key.

1. Modify the `terraform.tfvars` file to include your public key (get it by runnig `cat ~/.ssh/id_rsa.pub`).

1. Modify the `terraform.tfvars` file for a different region, instance type, etc (configurable variables can be found in `variables.tf`).

1. Run `terraform init` and `terraform apply` from the repository directory to create the proxy and security group.

1. Follow the instructions from the terraform output to ssh to the new instance and configure the SOCKS proxy.

If you forget this output down the road, you can type `terraform output` to show the instructions again.

### How to remove

1. Run `terraform destroy` from the repository directory to delete the proxy and security group.  You'll be asked for confirmation.

#### Notes

* Port 80 is used by default, as port 80 will typically be open in firewalls and such (same port as HTTP). This port can be configured in `terraform.tfvars` if desired.

* t2.micro instances can be run for free for 12 months on a new AWS account, and can be really cheap after that.  If you think you need a bigger instance, it can be configured in `terraform.tfvars` but will cost more.

* Depending on your system, DNS queries _should_ be forwarded over the SOCKS proxy as well.  If you are behind a DNS filter this should still work.

* Obvious to some people but just to be clear - Using a tunnel doesn't protect your identity.
