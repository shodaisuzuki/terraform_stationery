#変数をここで定義する
#環境毎に変わるので変数の値は各環境のtfvarsで代入する


variable "ec2-sg" {type = "list"}
variable "app-server-key-pair" {}

#===Load Balancer===
variable "alb_ssl_pulicy" {}
variable "certificate_arn" {}

#===Launch Configuration===
variable "ami_id" {}
variable "instance_type" {}
variable "iam_role" {}
variable "root_volume_size" {}
variable "userdata_file_path" {}

#===Auto Scaling Group===
variable "app_server_max_size" {}
variable "app_server_min_size" {}
variable "api_server_max_size" {}
variable "api_server_min_size" {}
