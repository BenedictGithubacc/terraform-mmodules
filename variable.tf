variable "aws_region" {
  description = "region where resource created"
  type = string
  default = "ap-south-1"
}

variable "cidr_block" {
  description = "cidr block for vpc"
  type = string 
  default = "10.0.0.0/16"
  
}
variable "pub1_cidr_block" {
  description = "cidr block for public subnet1"
  type = string 
  default = "10.0.1.0/24"
  
}
variable "pub1_availaibility_zone" {
  description = "zone for public subnet 1"
  type = string 
  default = "ap-south-1a"
  
}
variable "pub2_cidr_block" {
  description = "cidr block for subnet 2"
  type = string 
  default = "10.0.2.0/24"
  
}
variable "pub2_availability_zone" {
  description = "zone for public subnet 2"
  type = string 
  default = "ap-south-1b"
  
}
variable "pvt1_cidr_block" {
  description = "cidr block for private subnet 1"
  type = string 
  default = "10.0.3.0/24"
  
}
variable "pvt1_availability_zone" {
  description = "zone for private subnet 1"
  type = string 
  default = "ap-south-1a"
  
}
variable "pvt2_cidr_block" {
  description = "cidr block for private subnet 2"
  type = string 
  default = "10.0.4.0/24"
  
}
variable "pvt2_availability_zone" {
  description = "availability zone for private subnet 2"
  type = string 
  default = "ap-south-1b"
  
}
variable "pub_sg_ssh" {
  description = "ssh security port number"
  type = string 
  default = "22"
  
}
variable "pub_sg_http" {
  description = "aecurity port number for http"
  type = string 
  default = "80"
  
}
variable "pvt_sg_mysql" {
  description = "mysql port number"
  type = string 
  default = "3306"
  
}
variable "aws_ami" {
    description = "aws image name"
    type = string
    default = "ami-06b6e5225d1db5f46"
}
variable "availability_zone1" {
    description = "availability zone"
    type = string
    default = "ap-south-1a"
}
variable "availability_zone2" {
    description = "availability zone"
    type = string
    default = "ap-south-1b"
}
variable "instance_type" {
    description = "instance type"
    type = string
    default = "t2.micro"
}
variable "instance_class" {
    description = "instance class for db"
    type = string
    default = "db.t3.micro"
}
variable "lb_types" {
  description = "load balancer types"
   type = string 
   default = "application"
}

