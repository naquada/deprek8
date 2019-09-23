package main

# Based on https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.16.md

# All resources under apps/v1beta1 and apps/v1beta2 - use apps/v1 instead
deny[msg] {
  apis := ["apps/v1beta1", "apps/v1beta2"]
  input.apiVersion == apis[_]
  msg := sprintf("%s/%s: API %s is no longer served by default, use apps/v1 instead.", [input.kind, input.metadata.name, input.apiVersion])
}

# daemonsets, deployments, replicasets resources under extensions/v1beta1 - use apps/v1 instead
deny[msg] {
  resources := ["DaemonSet", "Deployment", "ReplicaSet"]
  input.apiVersion == "extensions/v1beta1"
  input.kind == resources[_]
  msg := sprintf("%s/%s: API extensions/v1beta1 for %s is no longer served by default, use apps/v1 instead.", [input.kind, input.metadata.name, input.kind])
}

# networkpolicies resources under extensions/v1beta1 - use networking.k8s.io/v1 instead
deny[msg] {
  input.apiVersion == "extensions/v1beta1"
  input.kind == "NetworkPolicy"
  msg := sprintf("%s/%s: API extensions/v1beta1 for NetworkPolicy is no longer served by default, use networking.k8s.io/v1 instead.", [input.kind, input.metadata.name])
}

# podsecuritypolicies resources under extensions/v1beta1 - use policy/v1beta1 instead
deny[msg] {
  input.apiVersion == "extensions/v1beta1"
  input.kind == "PodSecurityPolicy"
  msg := sprintf("%s/%s: API extensions/v1beta1 for PodSecurityPolicy is no longer served by default, use policy/v1beta1 instead.", [input.kind, input.metadata.name])
}

# Ingress resources will no longer be served from extensions/v1beta1 in v1.20. Migrate use to the networking.k8s.io/v1beta1 API, available since v1.14.
warn[msg] {
  input.apiVersion == "extensions/v1beta1"
  input.kind == "Ingress"
  msg := sprintf("%s/%s: API extensions/v1beta1 for Ingress is deprecated, use networking.k8s.io/v1beta1 instead.", [input.kind, input.metadata.name])
}

# PriorityClass resources will no longer be served from scheduling.k8s.io/v1beta1 and scheduling.k8s.io/v1alpha1 in v1.17.
warn[msg] {
  apis := ["scheduling.k8s.io/v1beta1", "scheduling.k8s.io/v1alpha1"]
  input.apiVersion == apis[_]
  input.kind == "PriorityClass"
  msg := sprintf("%s/%s: API %s for PriorityClass is deprecated, use scheduling.k8s.io/v1 instead.", [input.kind, input.metadata.name, input.apiVersion])
}

# The apiextensions.k8s.io/v1beta1 version of CustomResourceDefinition is deprecated and will no longer be served in v1.19. Use apiextensions.k8s.io/v1 instead.
warn[msg] {
  input.apiVersion == "apiextensions.k8s.io/v1beta1"
  input.kind == "CustomResourceDefinition"
  msg := sprintf("%s/%s: API apiextensions.k8s.io/v1beta1 for CustomResourceDefinition is deprecated, use apiextensions.k8s.io/v1 instead.", [input.kind, input.metadata.name])
}

# The admissionregistration.k8s.io/v1beta1 versions of MutatingWebhookConfiguration and ValidatingWebhookConfiguration are deprecated and will no longer be served in v1.19. Use admissionregistration.k8s.io/v1 instead.
warn[msg] {
  kinds := ["MutatingWebhookConfiguration", "ValidatingWebhookConfiguration"]
  input.apiVersion == "admissionregistration.k8s.io/v1beta1"
  input.kind == kinds[_]
  msg := sprintf("%s/%s: API admissionregistration.k8s.io/v1beta1 for %s is deprecated, use admissionregistration.k8s.io/v1 instead.", [input.kind, input.metadata.name, input.kind])
}
