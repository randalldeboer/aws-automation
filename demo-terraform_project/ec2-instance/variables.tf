variable "ami" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  default     = "ami-099dfee16f9ed13df" 
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
  default     = "web-instance-2"
}