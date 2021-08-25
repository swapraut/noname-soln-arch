Create a Noname Server in hosted/on-premise AWS environment.
Configuration in this directory creates a security group, Noname server with Elastic IP.

Note: Please remove Elastic IP resource if you are planning to access using private IP.

Usage
To run this example you need to execute:

$ terraform init
$ terraform plan
$ terraform apply
Note that this example may create resources which can cost money. Run terraform destroy when you don't need these resources.

Requirements
Name	Version
terraform	>= 0.13
aws	>= 3.0
Providers
Name	Version
aws	>= 3.55
