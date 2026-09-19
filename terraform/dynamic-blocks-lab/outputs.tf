output "security_group_id" {
  value = aws_security_group.example.id
}

output "ingress_count" {
  value = length(var.ingress_rules)
}
