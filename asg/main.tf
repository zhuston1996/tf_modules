resource "aws_launch_template" "launch_template" {
  name_prefix   = var.process_name
  image_id      = var.image_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  on_demand_base_capacity = var.on_demand_base_capacity
  max_instance_lifetime = var.max_instance_lifetime

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "asp" {
  name                   = var.scaling_policy_name
  scaling_adjustment     = var.scaling_adjustment
  adjustment_type        = var.adjustment_type
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

# module "auto-scaling-group" "asg1" {
#     source = "../modules/auto-scaling-group"
#     process_name = "ha_document_analyzer"
#     image_id = "ami-abcdef012345"
#     desired_capacity = 5
#     max_size = 10
#     min_size = 0
#     on_demand_base_capacity = 1
#     max_instance_lifetime = 123567
#     scaling_name = "analyze_document_queue"
#     scaling_adjustment = 4
#     adjustment_type = "queue"
# }
