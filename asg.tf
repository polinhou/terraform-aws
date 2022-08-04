resource "aws_launch_template" "polin-launch-template" {
  name_prefix   = "polin-"
  image_id      = "ami-0cea098ed2ac54925"
  instance_type = "t2.micro"

  network_interfaces {
    security_groups    = [aws_security_group.allow_http8080.id]
  }

  user_data = filebase64("${path.module}/nginx.sh")
}

resource "aws_autoscaling_group" "polin-asg" {
  name                = "polin-asg"
  vpc_zone_identifier = data.aws_subnets.polin_subnets.ids
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2

  launch_template {
    id      = aws_launch_template.polin-launch-template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.polin_tg.arn]

  depends_on = [aws_subnet.polin_subnet, aws_subnet.polin_subnet2, aws_subnet.polin_subnet3]
}
