terraform {
  required_version = ">= 0.12.0"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "hc-emea-sentinel-demo"

    workspaces {
      name = "sentinel-demo-network"
    }
  }
}
provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "sentinel_demo_vpc" {
  cidr_block            = var.vpc_cidr_block
  enable_dns_hostnames  = true

  tags = {
    Name           = var.namespace
    owner          = var.owner
  }
}

resource "aws_subnet" "sentinel_demo_subnet" {
  count                   = "${length(var.cidr_blocks)}"
  vpc_id                  = aws_vpc.sentinel_demo_vpc.id
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block              = "${var.cidr_blocks[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name           = var.namespace
    owner          = var.owner
  }
}