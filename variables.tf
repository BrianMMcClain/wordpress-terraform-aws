variable "aws_region" {
  description = "Region to deploy Wordpress to"
  type        = string
  default     = "us-east-2"
}

variable "wordpress_instance_size" {
  description = "Instance size for the Wordpress server"
  type        = string
  default     = "t2.micro"
}