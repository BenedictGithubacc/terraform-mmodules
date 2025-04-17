terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "remote" {
    hostname = "domain.scalr.io"
    organization = "domain"

    workspaces {
      name = "new-modules"
    }
  }
}




# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}