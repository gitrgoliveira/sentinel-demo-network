variable "region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.1.0.0/16"
}

variable "cidr_blocks" {
  description = "The CIDR blocks to create the workstations in."
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "owner" {
  description = "Owner tag"
  default     = "demoric"
}

variable "namespace" {
  description = "Namespace tag"
  default     = "sentinel-demo"
}