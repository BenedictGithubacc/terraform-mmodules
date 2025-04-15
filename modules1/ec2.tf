
resource "aws_instance" "web-1" {
  ami           = var.aws_ami 
  instance_type = var.instance_type
  availability_zone = var.availability_zone1
  associate_public_ip_address = true
  key_name         = "mumbai-key"
  vpc_security_group_ids = [var.aws_public_sg]
  subnet_id = var.pub1_subnet_id
  user_data = file("${path.module}/web-app.sh")
  tags = {
    Name = "web-1"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("${path.module}/mumbai-key.pem")
    password = ""
    host     = self.public_ip
  }
  provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
  inline = [
    "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
      "sudo cp /tmp/index.html /var/www/html",
  ]
}

}
  
  resource "aws_instance" "web-2" {
  ami           = var.aws_ami 
  instance_type = var.instance_type
  availability_zone = var.availability_zone2
  associate_public_ip_address = true
  key_name         = "mumbai-key"
  vpc_security_group_ids = [var.aws_public_sg]
  subnet_id = var.pub2_subnet_id
  user_data = file("${path.module}/web-app.sh")
  tags = {
    Name = "web-2"
  }

connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("${path.module}/mumbai-key.pem")
    password = ""
    host = self.public_ip
  }
  provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
  inline = [
           "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
      "sudo cp /tmp/index.html /var/www/html",
  ]
}

  }
 

