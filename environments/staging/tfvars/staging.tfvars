#ここには環境特有の設定値のみ書くこと
#共通の設定値はホームのtfvars/variables.tfvarsに書く

#env
#env = "staging"

#vpc
#vpc = "vpc-XXXX"

#subnets
#subnets = [
#  "subnet-XXXXX",
#  "subnet-XXXXX"
#]

#security-group
#alb-sg = [
#  "sg-XXXXX",
#  "sg-XXXXX"
#]
#
#ec2-sg = [
#  "sg-XXXXX",
#  "sg-XXXXX"
#]

#key_pair
#key_pair = "app-server-key-pair"

#===Load Balancer===
#alb_ssl_pulicy = ""
#certificate_arn = ""

#===Launch Configuration===
#ami_id = "ami-XXXX"
#instance_type = "t2.xlarge"
#iam_role = "app-server-role"
#root_volume_size = 500
#userdata_file_path = "../user_data/user_data.sh"
#
#===Auto Scaling Group===
#app_server_max_size = 1
#app_server_min_size = 1
#
#api_server_max_size = 1
#api_server_min_size = 1
