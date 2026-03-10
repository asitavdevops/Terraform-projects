terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.2.0"
}

# Configure the AWS Provider for us-east-1
provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

# Provider for us-west-2
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
# EC2 instance in us-east-1
resource "aws_instance" "east-app-server" {
  provider      = aws.east
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform East Demo"
  }
}

# EC2 instance in us-west-2
resource "aws_instance" "west_instance" {
  provider      = aws.west
  ami           = "ami-0ceecbb0f30a902a6" 
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-West-Instance"
  }
}

