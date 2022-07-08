resource "kubernetes_deployment" "java" {
  metadata {
    name = "deployment-cluster"
    labels = {
      app  = "springboot_docker"
    }
  }
spec {
    replicas = 2
selector {
      match_labels = {
        app  = "springboot_docker"
      }
    }
template {
      metadata {
        labels = {
          app  = "springboot_docker"
        }
      }
spec {
        container {
          image = "322757803258.dkr.ecr.us-east-1.amazonaws.com/springboot_docker:latest"
          name  = "springboot_docker"
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
    name = "springboot_docker"
  }
  spec {
    selector = {
      app = "springboot_docker"
    }
    port {
      port        = 80
      target_port = 8080
    }
type = "LoadBalancer"
}
}