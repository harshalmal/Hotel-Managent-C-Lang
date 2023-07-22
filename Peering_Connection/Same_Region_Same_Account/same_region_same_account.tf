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
    access_key = "Put your AWS Access Key"
    secret_key = "Put your AWS Secret Key"
}

########*********VPC Peering Configuration*********########

## For Same Region Same Account
resource "aws_vpc_peering_connection" "vpc_peer_1_n_2_SRSA" {
    peer_owner_id = "Put your AWA Account ID"   ## AWS Account ID for 1st VPC
    peer_vpc_id   = aws_vpc.main_vpc_2.id
    vpc_id        = aws_vpc.main_vpc_1.id
    ##peer_region = "ap-south-1"  ## mention location of 2nd VPC region
    auto_accept   = true        ## Value is "False" for different region  

    tags = {
    Name = "vpc_peer_1_n_2_SRSA"
    }
}

##resource "aws_vpc" "main_vpc_1" {
##    cidr_block = "10.0.0.0/20"
##}

##resource "aws_vpc" "main_vpc_2" {
##    cidr_block = "192.168.0.0/20"
##}



## For Same Region Same Account
