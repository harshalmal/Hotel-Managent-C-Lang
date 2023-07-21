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
    access_key = "AKIA3YSURKKH5TIXGJJG"
    secret_key = "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"
}