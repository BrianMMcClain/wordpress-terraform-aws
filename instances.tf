data "aws_ami" "wordpress_ami" {
  most_recent = true
  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-kinetic-22.10-amd64-server-20221101"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "server_kp" {
  key_name   = "wordpress_kp"
  public_key = file("./keys/wordpress.pub")
}

resource "aws_instance" "wordpress_server" {
  instance_type = var.wordpress_instance_size
  ami           = data.aws_ami.wordpress_ami.id

  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]

  key_name = aws_key_pair.server_kp.key_name

  user_data = file("./install.sh")

  tags = {
    Name      = "wordpress-server"
    Terraform = true
  }
}