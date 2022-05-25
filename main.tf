
resource "aws_subnet" "subnet" {
  count                   = length(var.cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidrs[count.index]
  availability_zone       = var.zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name         = "${var.name}.${var.zones[count.index]}"
    Environment  = var.env
    Provisioner  = "Terraform"
  }
}

resource "aws_route_table" "rtb" {
  count            = length(var.cidrs)
  vpc_id           = var.vpc_id

  tags = {
    Name         = "${var.name}.${var.zones[count.index]}.private"
    Environment  = var.env
    Provisioner  = "Terraform"
  }
}

resource "aws_route_table_association" "rtba" {
  count          = length(var.cidrs)
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = element(aws_route_table.rtb.*.id, count.index)
}

resource "aws_route" "route" {
  count                  = length(var.cidrs)
  route_table_id         = element(aws_route_table.rtb.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nats[count.index]

  depends_on = [
    aws_route_table.rtb,
  ]
}

