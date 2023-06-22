provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "intro" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "ansiblelabs"
  vpc_security_group_ids = ["sg-0dc8e60c685dffb8c"]
  tags = {
    Name = "First Instance"
  }
}