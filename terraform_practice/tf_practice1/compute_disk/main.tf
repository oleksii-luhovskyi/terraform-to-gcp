resource "google_compute_disk" "gc_compute_disk" {
  name = var.DISK_NAME
  type = var.DISK_TYPE
  size = var.DISK_SIZE
  zone = var.DISK_ZONE
}