resource "aws_key_pair" "jay-key" {
  key_name   = "jaykey"
  public_key = file("jaykey.pub")
}


resource "aws_instance" "jay_inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.jay-pub-1.id
  key_name               = aws_key_pair.jay-key.key_name
  vpc_security_group_ids = [aws_security_group.jay-sg1.id]
  tags = {
    Name = "First Instance"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }


  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("jaykey")
    host        = self.public_ip
  }
}

resource "aws_ebs_volume" "vol_4_j" {
  availability_zone = var.ZONE1
  size              = 3
}

resource "aws_volume_attachment" "atch_vol_j" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_j.id
  instance_id = aws_instance.jay_inst.id
}

output "PublicIP" {
  value = aws_instance.jay_inst.public_ip
}

