terraform {
  backend "s3" {
    # created bucket in aws with name below
    bucket = "terra-state-jay"
    # key below is the folder name so I have a dir called terraform and in that a folder called backend!
    key    = "terraform/backend"
    region = "us-east-1"

  }
}