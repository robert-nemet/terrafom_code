resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_container_cluster" "default" {
  name               = "default-node-pool"
  initial_node_count = 1

  remove_default_node_pool = true
}

resource "google_container_node_pool" "production-preemptible_nodes" {
  name       = "production-nodes-pool"
  cluster    = google_container_cluster.default.id
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      enviroment = "production"
    }
  }
}

resource "google_container_node_pool" "dev-preemptible_nodes" {
  name       = "dev-nodes-pool"
  cluster    = google_container_cluster.default.id
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      enviroment = "dev"
    }
  }
}
