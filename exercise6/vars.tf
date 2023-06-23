variable "REGION" {
  default = "us-east-1"
}
variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}


variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-053b0d53c279acc90"
    us-east-2 = "ami-0e820afa569e84cc1"
  }
}

variable "USER" {
  default = "ubuntu"

}

variable "PUB_KEY" {
  default = "jaykey.pub"
}

variable "PRIV_KEY" {
  default = "jaykey"
}