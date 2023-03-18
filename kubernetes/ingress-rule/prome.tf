resource "kubernetes_ingress_v1" "prome-ingress" {
  metadata {
    name      = "promethues-grafana"
    namespace = "prometheus"
    labels = {
      name = "prometheus"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "grafana.nwokolo.live"
      http {
        path {
          backend {
            service{
              name = "my-kube-prometheus-stack-grafana"
              port {
               number = 3000
               }
          }
        }
      }
    }
  }
}
}