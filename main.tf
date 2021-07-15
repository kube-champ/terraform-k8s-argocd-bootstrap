resource "kubernetes_namespace" "argo" {
  metadata {
    name   = var.namespace
    labels = var.namespace_labels
  }

  lifecycle {
    ignore_changes = [
      metadata[0].labels,
    ]
  }
}

resource "random_password" "argo_admin_password" {
  length           = 10
  special          = true
  override_special = "_%@"
}
