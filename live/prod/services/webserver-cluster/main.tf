provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "github.com/ShamrockOo4tune/tf-study-modules//services/webserver-cluster?ref=0.0.1"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "shamrockoo4tune-tf-state"
  db_remote_state_key    = "prod/data-store/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 5
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale-out-during-business-hours"
  min_size              = 2
  max_size              = 5
  desired_capacity      = 5
  recurrence            = "0 9 * * *"
  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale-in-at-night"
  min_size              = 2
  max_size              = 5
  desired_capacity      = 2
  recurrence            = "0 17 * * *"
  autoscaling_group_name = module.webserver_cluster.asg_name
}
