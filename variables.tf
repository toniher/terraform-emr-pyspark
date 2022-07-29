variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type    = string
  default = "subnet-8a280df7"
}

variable "vpc_id" {
  type    = string
  default = "vpc-68c6c103"
}

variable "release_label" {
  type = string
}

variable "applications" {
  type = list(string)
}

variable "master_instance_type" {
  type = string
}

variable "master_ebs_size" {
  type = string
}

variable "core_instance_type" {
  type = string
}

variable "core_instance_count" {
  type = string
}

variable "core_ebs_size" {
  type = string
}

variable "ingress_cidr_blocks" {
  type = string
}
