resource "kubernetes_manifest" "kube_manifest" {
  for_each = fileset("${path.module}/manifests/", "*.yaml")
  manifest = yamldecode(file("${path.module}/manifests/${each.key}"))
}

