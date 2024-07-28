variable "NETWORK_NAME" {
  type = string
  default = ""
}

variable "AUTO_CREATE_SUB" {
  type = bool
  default = false
}

variable "SUB_IP_CIDR_RANGE" {
  type = string
  default = "10.1.0.0/24"
}

variable "SUB_NAME" {
  type = string
  default = "custom-sub-via-tf"
}

variable "SUB_REGION" {
  type = string
  default = "us-central1-b"
}

variable "SUB_PRIVATE_G_ACCESS" {
  type = bool
  default = true
}

variable "FIREWALL_NAME" {
  type = string
  default = "allow-icmp"
}

variable "FIREWALL_RANGES" {
  type = list(string)
  default = ["194.44.179.51/32", "213.174.29.154/32"]
}

variable "FIREWALL_ICMP" {
  type = string
  default = "icmp"
}