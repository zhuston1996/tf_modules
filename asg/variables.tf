variable "process_name" {
  type        = string
  description = "Launch template process name"
}

variable "image_id" {
  type        = string
  description = "AMI image id"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "desired_capacity" {
  type        = number
  description = "number of desired capcacity of ASG"
}

variable "max_size" {
  type        = number
  description = "max size of capcacity of ASG"
}

variable "min_size" {
  type        = number
  description = "min size of capcacity of ASG"
}

variable "on_demand_base_capacity" {
  type        = number
  description = "on demand capcacity of ASG"
}

variable "max_instance_lifetime" {
  type        = number
  description = "max instance liftime of ASG"
}

variable "scaling_policy_name" {
  type        = string
  description = "Name of autoscaling policy"
}

variable "scaling_adjustment" {
  type        = number
  description = "scaling adjustment of autoscaling policy"
}

variable "adjustment_type" {
  type        = string
  description = "type of adjustment; Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity"
}
