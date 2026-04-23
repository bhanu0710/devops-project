provider "google" {
  project = var.project_id
  region  = var.region
}

# ---------------------------
# GKE Cluster
# ---------------------------
resource "google_container_cluster" "gke_cluster" {
  name     = "devops-cluster"
  location = var.region

  # Disable default node pool (important)
  remove_default_node_pool = true
  initial_node_count       = 1

  # 👇 IMPORTANT: prevents SSD quota usage
  node_config {
    disk_size_gb = 20
    disk_type    = "pd-standard"
  }
}

# ---------------------------
# Custom Node Pool (2 nodes)
# ---------------------------
resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool"
  cluster    = google_container_cluster.gke_cluster.name
  location   = var.region
  node_count = 2

  node_config {
    machine_type = "e2-medium"

    # 👇 VERY IMPORTANT (quota fix)
    disk_size_gb = 20
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
