output "wordpress_ip" {
  value = aws_instance.wordpress_server.public_ip
}

output "wordpress_url" {
  value = "http://${aws_instance.wordpress_server.public_ip}"
}
