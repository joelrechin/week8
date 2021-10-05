resource "aws_subnet" "automation-sub-a" {
  vpc_id                  = aws_vpc.automation-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "automation-sub-a"
  }
}

resource "aws_subnet" "automation-sub-b" {
  vpc_id                  = aws_vpc.automation-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "automation-sub-b"
  }
}
