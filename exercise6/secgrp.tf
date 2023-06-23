resource "aws_security_group" "jay-sg1" {
  vpc_id      = aws_vpc.jay.id
  name        = "j-stack-sg"
  description = "jaytest"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow ssh"
  }
}