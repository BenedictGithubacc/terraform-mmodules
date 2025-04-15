variable "aws_ami" {
    description = "aws image name"
    type = string
    #default = "ami-0f9de6e2d2f067fca"
}
variable "instance_type" {
    description = "instance type"
    type = string
    #default = "t2.micro"
}
variable "availability_zone1" {
    description = "availability zone"
    type = string
    #default = "ap-south-1a"
}
variable "availability_zone2" {
    description = "availability zone"
    type = string
    #default = "ap-south-1b"
}
variable "pub1_subnet_id" {}

variable "aws_public_sg" {}

variable "pub2_subnet_id" {}