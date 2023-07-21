## Terraform AWS Provider
terraform {
    required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.8.0"
    }
    }
}

provider "aws" {
    region     = "ap-south-1" 
    access_key = "Put here aws account access key"
    secret_key = "Put here aws account secret key"
}
