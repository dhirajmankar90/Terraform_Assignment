variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ports" {
  type = list(number)
}

variable "subnet_id" {
  type = string
}

variable "number_instances" {
  type = number
}