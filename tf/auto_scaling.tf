# Launch Configuration
#resource "aws_launch_configuration" "app_server_lc" {
#  image_id                    = "${var.ami_id}"
#  instance_type               = "${var.instance_type}"
#
#  name_prefix                 = "${var.env}-lc"
#  iam_instance_profile        = "${var.iam_role}"
#  enable_monitoring           = false
#  user_data                   = "${file(var.userdata_file_path)}"
#  associate_public_ip_address = false
#
#  root_block_device {
#    volume_size               = "${var.root_volume_size}"
#    volume_type               = "gp2"
#    delete_on_termination     = true
#  }
#
#  security_groups             = "${var.ec2_sg}"
#
#  key_name                    = "${var.key_pair:}"
#
#  lifecycle {
#    create_before_destroy     = "true"
#  }
#}

# Auto Scaling Group
#resource "aws_autoscaling_group" "app_server_asg" {
#  launch_configuration    = "${aws_launch_configuration.app_server_lc.name}"
#
#  name                    = "${var.env}-asg"
#  vpc_zone_identifier     = "${var.subnets}"
#  target_group_arns       = "${aws_alb_target_group.app_server_tg.arn}"
#  health_check_type         = "ELB"
#  health_check_grace_period = 300
#
#  min_size                = "${var.app_server_min_size}"
#  max_size                = "${var.app_server_max_size}"
#
#  tag {
#    key                   = "Name"
#    value                 = "${var.env}-app-ec2"
#    propagate_at_launch   = true
#  }
#  tag {
#    key                   = "Env"
#    value                 = "${var.env}"
#    propagate_at_launch   = true
#  }
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}

#resource "aws_autoscaling_group" "api_server_asg" {
# launch_configuration    = "${aws_launch_configuration.app_server_lc.name}" #起動設定は共通
#
# name                    = "${var.env}-asg"
# vpc_zone_identifier     = "${var.subnets}"
#  target_group_arns       = "${aws_alb_target_group.api_server_tg.arn}"
#  health_check_type         = "ELB"
#  health_check_grace_period = 300
#
#  min_size                = "${var.api_server_min_size}"
#  max_size                = "${var.api_server_max_size}"
#
#  tag {
#    key                   = "Name"
#    value                 = "${var.env}-api-ec2"
#    propagate_at_launch   = true
#  }
#  tag {
#    key                   = "Env"
#    value                 = "${var.env}"
#    propagate_at_launch   = true
#  }
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}
