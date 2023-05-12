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
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0fcf52bcf5db7b003"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance2021"
  }
}

output "app_server" {
  value = "${aws_instance.app_server.public_ip}"
}
