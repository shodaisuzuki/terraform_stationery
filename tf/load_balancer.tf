#Aplication Load Balancer
#resource "aws_alb" "app_sever_alb" {
#  name            = "${var.env}-alb"
#  internal        = false
#  ip_address_type = "ipv4"
#
#  subnets         = "${var.subnets}"
#  security_groups = "${var.alb-sg}"
#
#  tags {
#    Name      = "${var.env}-alb"
#    Env       = "${var.env}"
#  }
#}

#Target Group
#resource "aws_alb_target_group" "app_server_tg" {
#  name                  = "${var.env}-app-tg"
#  protocol              = "HTTP"
#  port                  = 8080
#  vpc_id                = "${var.vpc}"
#  deregistration_delay  = 300
#
#  health_check {
#    protocol            = "HTTP"
#    path                = "/index.html"
#    port                = "traffic-port"
#    healthy_threshold   = 5
#    unhealthy_threshold = 7
#    timeout             = 5
#    interval            = 10
#    matcher             = 200
#  }
#
#  stickiness {
#    type                = "lb_cookie"
#    enabled             = true
#    cookie_duration     = 86400
#  }

#  tags {
#    Name      = "${var.env}-api-tg"
#    Env       = "${var.env}"
#  }
#}

 #resource "aws_alb_target_group" "api_server_tg" {
 #  name                  = "${var.env}-api-tg"
 #  protocol              = "HTTP"
 #  port                  = 8080
 #  vpc_id                = "${var.vpc}"
 #  deregistration_delay  = 300
 #
 #  health_check {
 #    protocol            = "HTTP"
 #    path                = "/index.html"
 #    port                = "traffic-port"
 #    healthy_threshold   = 5
 #    unhealthy_threshold = 7
 #    timeout             = 5
 #    interval            = 10
 #    matcher             = 200
 #  }
 #
 #  stickiness {
 #    type                = "lb_cookie"
 #    enabled             = true
 #    cookie_duration     = 86400
 #  }
 #
 #  tags {
 #    Name      = "${var.env}-api-tg"
 #    Env       = "${var.env}"
 #  }
 #}

#ALB Listener
#resource "aws_alb_listener" "app_server_listener" {
#  load_balancer_arn = "${aws_alb.app_server_alb.arn}"
#  protocol          = "HTTPS"
#  port              = 443
#  ssl_policy        = "${var.alb_ssl_pulicy}"
#  certificate_arn   = "${var.certificate_arn}"
#
#  default_action {
#    target_group_arn = "${aws_alb_target_group.server_app_tg.arn}"
#    type             = "forward"
#  }
#}

 #resource "aws_alb_listener" "api_server_listener" {
 #  load_balancer_arn = "${aws_alb.api_server_alb.arn}"
 #  protocol          = "HTTPS"
 #  port              = 443
 #  ssl_policy        = "${var.alb_ssl_pulicy}"
 #  certificate_arn   = "${var.certificate_arn}"
 #
 #  default_action {
 #    target_group_arn = "${aws_alb_target_group.server_api_tg.arn}"
 #    type             = "forward"
 #  }
 #}

# ALB Listener_rule
#/apiで始まるリクエストは"api-tg"へ振り分ける

#resource "aws_alb_listener_rule" "server_app_listener_rule" {
#  listener_arn = "${aws_alb_listener.app_server_listener.arn}"
#  priority     = 1
#
#  action {
#    type             = "forward"
#    target_group_arn = "${aws_alb_target_group.app_server_tg.arn}"
#  }
#
#  condition {
#    field  = "path-pattern"
#    values = ["/api/*"]
#  }
#}
