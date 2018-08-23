provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "sandbox" {
  ami               = "ami-64f1211e"
  availability_zone = "us-east-1d"

  root_block_device {
    volume_type = "gp2"
    volume_size = "80"
  }

  instance_type   = "m4.large"
  subnet_id       = "subnet-e1d6f1a8"
  security_groups = ["sg-096fad14738f6a031"]
  key_name        = "jenkins-git"
  count           = 1

  tags {
    Environment = "sandbox"
    OS          = "RHEL"
    Name        = "sandbox3"
  }
}
