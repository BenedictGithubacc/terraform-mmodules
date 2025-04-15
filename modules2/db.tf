resource "aws_db_instance" "database" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db-subnet-group.id
  availability_zone = var.availability_zone
  vpc_security_group_ids = [var.private_sg]
}

resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "main"
  subnet_ids = [var.pvt1_subnet, var.pvt2_subnet]

  tags = {
    Name = "My DB subnet group"
  }
}
