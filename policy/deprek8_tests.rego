package main

generate(version, kind) = obj {
  obj := {
    "apiVersion": version,
    "kind": kind,
    "metadata": { "name": "foo" }
  }
}

test_apps_v1beta1_is_deny {
  msg := deny with input as generate("apps/v1beta1", "foo")
  count(msg) == 1
}

test_apps_v1beta2_is_deny {
  msg := deny with input as generate("apps/v1beta2", "foo")
  count(msg) == 1
}

test_apps_v1_is_ok {
  msg := deny with input as generate("apps/v1", "foo")
  count(msg) == 0
}

test_daemonsets_extensions_v1beta1_is_deny {
  msg := deny with input as generate("extensions/v1beta1", "DaemonSet")
  count(msg) == 1
}

test_daemonsets_apps_v1_is_ok {
  msg := deny with input as generate("apps/v1", "DaemonSet")
  count(msg) == 0
}

test_deployments_extensions_v1beta1_is_deny {
  msg := deny with input as generate("extensions/v1beta1", "Deployment")
  count(msg) == 1
}

test_deployments_apps_v1_is_ok {
  msg := deny with input as generate("apps/v1", "Deployment")
  count(msg) == 0
}

test_replicasets_extensions_v1beta1_is_deny {
  msg := deny with input as generate("extensions/v1beta1", "ReplicaSet")
  count(msg) == 1
}

test_replicasets_apps_v1_is_ok {
  msg := deny with input as generate("apps/v1", "ReplicaSet")
  count(msg) == 0
}

test_networkpolicies_extensions_v1beta1_is_deny {
  msg := deny with input as generate("extensions/v1beta1", "NetworkPolicy")
  count(msg) == 1
}

test_networkpolicies_networkingk8sio_v1_is_ok {
  msg := deny with input as generate("networking.k8s.io/v1", "NetworkPolicy")
  count(msg) == 0
}

test_podsecuritypolicies_extensions_v1beta1_is_deny {
  msg := deny with input as generate("extensions/v1beta1", "PodSecurityPolicy")
  count(msg) == 1
}

test_podsecuritypolicies_policy_v1beta1_is_ok {
  msg := deny with input as generate("policy/v1beta1", "PodSecurityPolicy")
  count(msg) == 0
}

test_ingresses_extensions_v1beta1_is_warn {
  msg := warn with input as generate("extensions/v1beta1", "Ingress")
  count(msg) == 1
}

test_ingresses_networkingk8sio_v1beta1_is_ok {
  msg := warn with input as generate("networking.k8s.io/v1beta1", "Ingress")
  count(msg) == 0
}

test_priorityclasses_schedulingk8sio_v1beta1_is_warn {
  msg := warn with input as generate("scheduling.k8s.io/v1beta1", "PriorityClass")
  count(msg) == 1
}

test_priorityclasses_schedulingk8sio_v1alpha1_is_warn {
  msg := warn with input as generate("scheduling.k8s.io/v1alpha1", "PriorityClass")
  count(msg) == 1
}

test_priorityclasses_schedulingk8sio_v1_is_ok {
  msg := warn with input as generate("scheduling.k8s.io/v1", "PriorityClass")
  count(msg) == 0
}

test_customresourcedefinitions_apiextensionsk8sio_v1beta1_is_warn {
  msg := warn with input as generate("apiextensions.k8s.io/v1beta1", "CustomResourceDefinition")
  count(msg) == 1
}

test_customresourcedefinitions_apiextensionsk8sio_v1_is_ok {
  msg := warn with input as generate("apiextensions.k8s.io/v1", "CustomResourceDefinition")
  count(msg) == 0
}

test_mutatingwebhookconfigurations_admissionregistrationk8sio_v1beta1_is_warn {
  msg := warn with input as generate("admissionregistration.k8s.io/v1beta1", "MutatingWebhookConfiguration")
  count(msg) == 1
}

test_validatingwebhookconfigurations_admissionregistrationk8sio_v1beta1_is_warn {
  msg := warn with input as generate("admissionregistration.k8s.io/v1beta1", "ValidatingWebhookConfiguration")
  count(msg) == 1
}

test_mutatingwebhookconfigurations_admissionregistrationk8sio_v1_is_ok {
  msg := warn with input as generate("admissionregistration.k8s.io/v1", "MutatingWebhookConfiguration")
  count(msg) == 0
}

test_validatingwebhookconfigurations_admissionregistrationk8sio_v1_is_ok {
  msg := warn with input as generate("admissionregistration.k8s.io/v1", "ValidatingWebhookConfiguration")
  count(msg) == 0
}
