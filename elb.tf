resource "aws_lb" "polin_lb" {
  name               = "polin-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = data.aws_subnets.polin_subnets.ids

  tags = {
    Name = "polin-lb"
  }

  depends_on = [aws_subnet.polin_subnet, aws_subnet.polin_subnet2, aws_subnet.polin_subnet3]

}

resource "aws_lb_target_group" "polin_tg" {
    name        = "polin-tg"
    port        = 8080
    protocol    = "HTTP"
    vpc_id      = aws_vpc.polin_vpc.id
}

resource "aws_lb_listener" "polin_lb_listener" {
  load_balancer_arn = aws_lb.polin_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.polin_tg.arn
  }
}
