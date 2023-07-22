## Create VPC 1
resource "aws_vpc" "main_vpc_2" {
    cidr_block       = "192.168.0.0/20"
    instance_tenancy = "default"

    tags = {
    Name = "main_vpc_2"
}
}

## Create Subnet
resource "aws_subnet" "pub_sub_2" { 
    vpc_id     = aws_vpc.main_vpc_2.id
    cidr_block = "192.168.0.0/21"
    availability_zone = "ap-south-1a"
    ##  map_public_ip_on_launch = true
    tags = {
    Name = "pub_sub_2"
    }
}

resource "aws_subnet" "priv_sub_2" {
    vpc_id     = aws_vpc.main_vpc_2.id
    cidr_block = "192.168.8.0/21"
    availability_zone = "ap-south-1a"

    tags = {
    Name = "priv_sub_2"
    }
}

## Internet Gateway
resource "aws_internet_gateway" "igw2" {
    vpc_id = aws_vpc.main_vpc_2.id

    tags = {
    Name = "igw2"
    }
}

## Create EIP
resource "aws_eip" "eip2" {
    domain                    = "vpc"
    ##vpc = true
    tags = {
    Name = "eip2"
    }
}


## Create NAT GW
resource "aws_nat_gateway" "nat_gw_2" {
    allocation_id = aws_eip.eip2.id
    subnet_id     = aws_subnet.pub_sub_2.id
    connectivity_type = "public"
    
    tags = {
    Name = "nat_gw_2"
}
depends_on = [aws_internet_gateway.igw1]   
}

## Route Table

resource "aws_route_table" "pub_rt_2" {
    vpc_id = aws_vpc.main_vpc_2.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw2.id
    }

    tags = {
    Name = "pub_rt_2"
    }
    }


    resource "aws_route_table" "priv_rt_2" {
    vpc_id = aws_vpc.main_vpc_2.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_2.id
    }
    tags = {
    Name = "priv_rt_2"
    }
}

## Route table Association
resource "aws_route_table_association" "pub_rt_asso_2" {
    subnet_id = aws_subnet.pub_sub_2.id
    route_table_id = aws_route_table.pub_rt_2.id
}

resource "aws_route_table_association" "priv_rt_asso_2" {
    subnet_id = aws_subnet.priv_sub_2.id
    route_table_id = aws_route_table.priv_rt_2.id
}
