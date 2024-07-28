output "network_id" {
  value = google_compute_network.custom_compute_network.id
}

output "sub_network_id" {
  value = google_compute_subnetwork.custom_subnet.id
}