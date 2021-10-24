output "hello_world" {
  value = join(" ", var.simple_list)
}

output "welcome_msg" {
  value = local.welcome
}

output "secret_val" {
  value     = var.secret
  sensitive = true
}