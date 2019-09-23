# deprek8
Evergreen policy to monitor Kubernetes APIs deprecations.

# Quick how-to with Helm and Conftest
First, install [Conftest](https://github.com/instrumenta/conftest) (for MacOS users: `brew install instrumenta/instrumenta/conftest`)

```bash
$ cd stable/prometheus
$ curl https://raw.githubusercontent.com/naquada/deprek8/master/policy/policy.rego > policy.rego
$ helm template . | conftest test -p policy.rego -
FAIL - DaemonSet/release-name-prometheus-node-exporter: API extensions/v1beta1 for DaemonSet is no longer served by default, use apps/v1 instead.
FAIL - Deployment/release-name-prometheus-alertmanager: API extensions/v1beta1 for Deployment is no longer served by default, use apps/v1 instead.
FAIL - Deployment/release-name-prometheus-kube-state-metrics: API extensions/v1beta1 for Deployment is no longer served by default, use apps/v1 instead.
FAIL - Deployment/release-name-prometheus-pushgateway: API extensions/v1beta1 for Deployment is no longer served by default, use apps/v1 instead.
FAIL - Deployment/release-name-prometheus-server: API extensions/v1beta1 for Deployment is no longer served by default, use apps/v1 instead.
```
