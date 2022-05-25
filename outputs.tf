# Output

output "subnet_ids" {
  description = "A list of created private subnet ids"

  value = [
    aws_subnet.subnet.*.id,
  ]
}

output "private_route_table_ids" {
  description = "A list of created route table ids for the private subnets"

  value = [
    aws_route_table.rtb.*.id,
  ]
}
