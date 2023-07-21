## Route Table

resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.main_vpc.id
    

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
    Name = "pub_rt"
    }
    }


    resource "aws_route_table" "priv_rt" {
    vpc_id = aws_vpc.main_vpc.id

    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id

    }

    tags = {
    Name = "priv_rt"
    }
}

## Route table Association


##resource "aws_route_table_association" "" {
##    subnet_id      = aws_subnet.pub_sub.id
##    route_table_id = aws_route_table.pub_rt.id
##}

resource "aws_route_table_association" "pub_rt_asso" {
    subnet_id = aws_subnet.pub_sub.id
    route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "priv_rt_asso" {
    subnet_id = aws_subnet.priv_sub.id
    route_table_id = aws_route_table.priv_rt.id
}
