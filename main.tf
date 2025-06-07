resource "kubernetes_namespace" "production_namespace" {
  metadata {
    name = var.namespace_name

    labels = {
      environment = "production"
    }
  }
}

resource "kubernetes_pod" "production_pod" {
  metadata {
    name      = var.pod_name
    namespace = var.namespace_name

    labels = {
      application = "login"
    }
  }

  spec {
    container {
      name  = var.pod_name
      image = var.image_name

      port {
        container_port = var.container_port
      }
    }
  }
}

resource "kubernetes_service" "nodeport_service" {
  metadata {
    name      = var.service_name
    namespace = var.namespace_name
  }

  spec {
    selector = {
      application = "login"
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = var.container_port
    }
  }
}