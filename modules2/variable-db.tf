variable "instance_class" {
    description = "database instance class"
    type = string
    #default = "db.t3.micro"
}

variable "username" {
    description = "username for the db"
    type = string 
    default = "Admindb"
}

variable "password" {
    description = "password for db"
    type = string 
    default = "Admindb123"
    sensitive = true
}

variable "availability_zone" {
    description = "availability-zone"
    type = string 
    #default = "ap-south-1a"
}

variable "private_sg" {}
variable "pvt1_subnet" {}
variable "pvt2_subnet" {}