variable "access_key" {
  type    = string
  default = "XXXXXX"
}

variable "secret_key" {
  type    = string
  default = "YYYY"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "subnet_id" {
  type    = string
  default = "subnet-1234567"
}

variable "noname_ami_id" {
  type    = string
  default = "ami-1234567"
}

variable "noname_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "noname_key_name" {
  type    = string
  default = "foobar-key-pair"
}
