resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_security_group" "sg" {
    name = "basic-sg"
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "custom_inbound_rules" {
  count             = length(var.inbound_ports)

  type              = "ingress"
  from_port         = var.inbound_ports[count.index]
  to_port           = var.inbound_ports[count.index]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}

resource "aws_instance" "vm" {
  ami           = var.ami
  instance_type = "t2.micro"

  key_name = var.ssh_key_name

  tags = {
    Name = var.name
  }

  vpc_security_group_ids = [aws_security_group.sg.id]
}
