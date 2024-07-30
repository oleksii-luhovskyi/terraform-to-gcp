resource "google_compute_network" "custom_compute_network" {
  name                    = var.NETWORK_NAME
  auto_create_subnetworks = var.AUTO_CREATE_SUB
}

resource "google_compute_subnetwork" "custom_subnet" {
  ip_cidr_range            = var.SUB_IP_CIDR_RANGE
  name                     = var.SUB_NAME
  network                  = google_compute_network.custom_compute_network.id
  region                   = var.SUB_REGION
  private_ip_google_access = var.SUB_PRIVATE_G_ACCESS
}

resource "google_compute_firewall" "allow-tcp" {
  name    = var.FIREWALL_TCP_NAME
  network = google_compute_network.custom_compute_network.id

  allow {
    protocol = var.FIREWALL_ALLOW_TCP_PROTOCOL
    ports    = var.SUB_ALLOW_PORTS
  }

  source_ranges = var.FIREWALL_RANGES
  target_tags   = var.TARGET_TAGS
}

#resource "google_compute_firewall" "allow-icmp" {
#  name    = var.FIREWALL_ICMP_NAME
#  network = google_compute_network.custom_compute_network.id
#
#  allow {
#    protocol = var.FIREWALL_ALLOW_ICMP_PROTOCOL
#  }
#
#  source_ranges = var.FIREWALL_RANGES
#}