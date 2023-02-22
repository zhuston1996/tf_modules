variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "device_name" {
  type = string
}

variable "app_type" {
  type        = string
  description = "type of server"
}

variable "root_volume_encrypted" {
  type        = bool
  description = "root volume encryption"
  default     = true
}

variable "root_volume_iops" {
  type        = number
  description = "root volume iops"
}

variable "root_volume_throughput" {
  type        = number
  description = "root volume iops"
}

variable "root_volume_size" {
  type        = number
  description = "size of the root volume"
}

variable "root_volume_type" {
  type        = string
  description = "root volume type (exp gp3)"
  default     = "gp3"
}

variable "vpc_security_group_ids" {
  type        = list(any)
  description = "List of security group ids for the new AWS EC2 instance."
}

variable "subnet_id" {
  type        = string
  description = "aws instance subnet"
}

variable "key_name" {
  type        = string
  description = "Key pair for EC2 instance; For Windows AMIs, the private key file is required to obtain the password used to log into your instance. For Linux AMIs, the private key file allows you to securely SSH into your instance."
}

variable "add_eip" {
  type        = bool
  description = "Conditional variable to create an EIP on an instance or not."
}

variable "instance_profile" {
  type        = string
  description = "Instance role that will be attached to the EC2 instance."
  default     = null
}

variable "ebs_volume_names" {
  description = "kms_key_id must be an full KMS arn."
  type = map(object({
    ebs_volume        = string
    ebs_device_name   = string
    ebs_type          = string
    ebs_size          = number
    ebs_iops          = number
    ebs_throughput    = number
    availability_zone = string
    encrypted         = bool
    kms_key_id        = string
  }))
}