variable "secgroup_name" {
  type        = string
  description = "The name of the Security Group"
}

variable "allowed_ports" {
  type        = string
  description = "Allowed TCP ports, the format is: 80,443,20-23"
  default     = "22,3389,80,443"
}