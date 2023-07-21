## Create Subnet



resource "aws_subnet" "pub_sub" { 
    vpc_id     = aws_vpc.main_vpc.id
    cidr_block = "10.0.0.0/17"
    availability_zone = "ap-south-1a"
    ##  map_public_ip_on_launch = true
    tags = {
    Name = "pub_sub"
    }
}



resource "aws_subnet" "priv_sub" {
    vpc_id     = aws_vpc.main_vpc.id
    cidr_block = "10.0.128.0/17"
    availability_zone = "ap-south-1a"

    tags = {
    Name = "priv_sub"
    }
}
