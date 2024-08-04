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
  default = "us-central1"
}

variable "SUB_PRIVATE_G_ACCESS" {
  type = bool
  default = true
}

variable "FIREWALL_ICMP_NAME" {
  type = string
  default = "allow-icmp-tf"
}

variable "FIREWALL_TCP_NAME" {
  type = string
  default = "allow-tcp-tf"
}

variable "FIREWALL_RANGES" {
  type = list(string)
  default = ["157.230.48.41/32", "213.174.29.16/32", "167.172.131.122/32", "35.235.240.0/20"]
}

variable "FIREWALL_ALLOW_ICMP_PROTOCOL" {
  type = string
  default = "icmp"
}

variable "FIREWALL_ALLOW_TCP_PROTOCOL" {
  type = string
  default = "tcp"
}

variable "SUB_ALLOW_PORTS" {
  type = list(string)
  default = ["80", "443", "22"]
}

variable "TARGET_TAGS" {
  type = list(string)
  default = ["http-server"]
}