output "instance_id" {
  value = aws_instance.new_instance.id
}

output "security_group_id" {
  value = aws_security_group.new_security.id
}
