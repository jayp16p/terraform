resource "aws_key_pair" "jay-key" {
  key_name = "jaykey"
  public_key = file("jaykey.pub")
}


resource "aws_instance" "jay_inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.jay-key.key_name
  vpc_security_group_ids = ["sg-0dc8e60c685dffb8c"]
  tags = {
    Name = "First Instance"
  }
  provisioner "file" {
    source = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
  inline = [
    "chmod u+x /tmp/web.sh"
    "sudo /tmp/web.sh"
  ]
  }
  
  connection {
    user = var.user
    private_key = file("jaykey")
    host = self.public_ip
  }
}
