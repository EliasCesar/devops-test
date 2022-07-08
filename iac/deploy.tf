resource "kubernetes_deployment" "java" {
  metadata {
    name = "worker-group-1"
    labels = {
      app  = "worker-group-1"
    }
  }
spec {
    replicas = 2
selector {
      match_labels = {
        app  = "worker-group-1"
      }
    }
template {
      metadata {
        labels = {
          app  = "worker-group-1"
        }
      }
spec {
        container {
          image = "322757803258.dkr.ecr.us-east-1.amazonaws.com/springboot_docker:latest"
          name  = "worker-group-1"
          port {
            container_port = 8080
         }
        }
      }
    }
  }
}
resource "kubernetes_service" "java" {
  depends_on = [kubernetes_deployment.java]
  metadata {
    name = "worker-group-1"
  }
  spec {
    selector = {
      app = "worker-group-1"
    }
    port {
      port        = 80
      target_port = 8080
    }
type = "LoadBalancer"
}
}