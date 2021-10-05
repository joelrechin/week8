resource "aws_route_table" "automation-rt" {
  vpc_id = aws_vpc.automation-vpc.id
  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.automation-igw.id
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      local_gateway_id           = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]
  tags = {
    Name = "automation-rt"
  }
}
