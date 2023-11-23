resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace = "prod"
  values = [
    file("${path.module}/prometheus/values.yaml")
  ]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace = "prod"
  values = [
    file("${path.module}/grafana/values.yaml")
]
}

resource "kubernetes_manifest" "kube_manifest" {
  for_each = fileset("${path.module}/manifests/", "*.yaml")
  manifest = yamldecode(file("${path.module}/manifests/${each.key}"))
}