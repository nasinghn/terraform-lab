terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  #  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "app_server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.medium"

  tags = {
    Name = "ExampleAppServerInstance2021"
  }
}

output "app_server" {
  value = "${aws_instance.app_server.public_ip}"
}
