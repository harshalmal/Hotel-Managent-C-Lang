## Create EIP

resource "aws_eip" "eip" {
    domain                    = "vpc"
    
    ##vpc = true

    tags = {
    Name = "eip"
    }
}