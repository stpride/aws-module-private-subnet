variable "name" {
  default     = "private"
  description = "Name of the subnet"
}

variable "cidrs" {
  description = "A list of private subnet CIDR blocks"
  type        = list
  default     = []
}

variable "zones" {
  description = "A list of availability zones"
  type        = list
  default     = []
}

variable "vpc_id" {
  description = "The VPC ID"
}

variable "public_subnet_ids" {
  description = "A list of public subnet that will be routed to NAT Gateways"
  type        = list
  default     = []
}

variable "nats" {
  description = "A list of NAT Gateways in public subnets that will be used in routing"
  type        = list
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "Boolean that controls the subnets ability to assign public ip addresses (default=false)."
  default     = false
}

variable "propagating_vgws" {
  description = "A list of virtual gateways for propagation"
  type        = list
  default     = []
}

variable "env" {
  description = "Logical environment as it relates to the Shutterfly software release lifecycle (e.g. dev, stage, prod)"
}

