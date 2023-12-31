terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "my_ec2_instance" {
  count         = 2
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "terraformBatch-instance"
  }
}

resource "aws_s3_bucket" "my_s3_bucket" {
         bucket = "shyam-bucket-name"
         tags = {
                 Name = "shyam-bucket-name"
                 Environment = "Dev"
}
}


output "ec2_public_ips" {
       value = aws_instance.my_ec2_instance[*].public_ip
}

