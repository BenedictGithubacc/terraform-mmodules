resource "aws_lb" "elb" {
  name               = "elb"
  load_balancer_type = var.load_bakancer_type
  security_groups = [var.security_groups]

  subnet_mapping {
    subnet_id     = var.pub1_subnet
  }

  subnet_mapping {
    subnet_id     = var.pub2_subnet
  }

 tags = {
    name = "elb"
  }
}

resource "aws_lb_target_group" "elb-target" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_vpc
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb-target.arn
  }
}
resource "aws_lb_target_group_attachment" "attachment-1" {
  target_group_arn = aws_lb_target_group.elb-target.arn
  target_id        = var.aws_instance1
  port             = 80
}

resource "aws_lb_target_group_attachment" "attachment-2" {
  target_group_arn = aws_lb_target_group.elb-target.arn
  target_id        = var.aws_instance2
  port             = 80
}