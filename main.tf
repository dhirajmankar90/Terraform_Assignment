# CREATING SECURITY GROUP 
resource "aws_security_group" "allow_tls_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {

    for_each = var.ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf-3"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami                    = var.image_id
  count = var.number_instances
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.allow_tls_sg.id}"]
  key_name               = aws_key_pair.key-tf.key_name
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  tags = {
    Name = "my-machine-${count.index}"
  }
}
