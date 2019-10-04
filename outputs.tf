output "vpc" {
  description = "VPC ID"
  value       = aws_vpc.sentinel_demo_vpc.id
}
output "subnets" {
  description = "subnets"
  value = [aws_subnet.sentinel_demo_subnet.*.id]
}
