resource "aws_instance" "jay_inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "jay"
  vpc_security_group_ids = ["sg-0dc8e60c685dffb8c"]
  tags = {
    Name = "First Instance"
  }
}