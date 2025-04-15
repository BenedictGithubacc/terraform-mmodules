variable "region"  {
   description = "region for vpc"
   type        =  string
   #default     = "ap-south-1"    
}
variable "cidr_block" {
    description = "cidr block of vpc range"
    type        =  string
    #default     = "10.0.0.0/16"
 }
variable "pub1_cidr_block" {
    description = "cidr range of public subnet1"
    type        =  string
    #default     = "10.0.1.0/24"
}
 variable "pub1_availability_zone" {
    description = "zone of public subnet1"
    type        =  string
    #default     = "ap-south-1a"
 }
 variable "pub2_cidr_block" {
    description = "cidr range of public subnet2"
    type        =  string
    #default     = "10.0.2.0/24"
 }
 variable "pub2_availability_zone" {
    description = "zone of public subnet2"
    type        =  string
    #default     = "ap-south-1b"
 }
 variable "pvt1_cidr_block" {
    description = "cidr range of private subnet1"
    type        =  string
    #default     = "10.0.3.0/24"
 }
 variable "pvt1_availability_zone" {
    description = "zone of private subnet1"
    type        =  string
    #default     = "ap-south-1a"
 }
 variable "pvt2_cidr_block" {
    description = "cidr range of private subnet2"
    type        =  string
    #default     = "10.0.4.0/24"
 }
 variable "pvt2_availability_zone" {
    description = "zone of private subnet2"
    type        =  string
    #default     = "ap-south-1b"
 }
 variable "pub-sg-ssh" {
    description = "inbound traffic"
    type        =  string
    #default     = "22"
 }
 variable "pub-sg-http" {
    description = "inbound traffic"
    type        =  string
    #default     = "80"
 }
 variable "pvt-sg-mysql" {
    description = "inbound traffic"
    type        =  string
    #default     = "3306"
 }
