resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.eip.id
    subnet_id     = aws_subnet.pub_sub.id
    connectivity_type = "public"
    
    tags = {
    Name = "nat_gw"
}

depends_on = [aws_internet_gateway.igw]   
}