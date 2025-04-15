variable "load_bakancer_type" {
    description = "loadbalancer type"
    type = string 
    default = "application"
}

variable "security_groups" {}
variable "pub1_subnet" {}
variable "pub2_subnet" {}
variable "aws_vpc" {}
variable "aws_instance1" {}
variable "aws_instance2" {}

