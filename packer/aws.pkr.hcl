packer {
  required_plugins {
    amazon = {
      source = "github.com/hashicorp/amazon"
      version = ">= 1.3.0"
    }
  }
}
source "amazon-ebs" "baseline" {
  region = "us-east-2"
  instance_type = "t3.micro"
  source_ami_filter {
    filters = {
      name = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
      root-device-type = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners = ["099720109477"]
  }
  ssh_username = "ubuntu"
  ami_name = "portfolio-baseline-{{timestamp}}"
}
build { sources = ["source.amazon-ebs.baseline"] }
