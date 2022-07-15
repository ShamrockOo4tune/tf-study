variable "SERVER_PORT" {
  description = "The port the server will use for http requests"
  type = number
  default = 8080
}

variable "ALB_NAME" {
  description = "The name of the ALB"
  type        = string
  default     = "terraform-asg-example"
}

variable "INSTANCE_SECURITY_GROUP_NAME" {
  description = "The name of the security group for the EC2 Instances"
  type        = string
  default     = "terraform-example-instance"
}

variable "ALB_SECURITY_GROUP_NAME" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "terraform-example-alb"
}

