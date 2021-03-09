# Volterra
volterra work using f5-devops-containers
---

includes:
- pre-commit
- go
- docker
- terraform
- terraform-docs
- vesctl
- kubectl
- helm
- awscli
- awsiam
## Development

don't forget to add your git user config

```bash
git config --global user.name "myuser"
git config --global user.email "myuser@domain.com"
```
---
checking for secrets as well as linting is performed by git pre-commit with the module requirements handled in the devcontainer.

testing pre-commit hooks:
  ```bash
  # test pre commit manually
  pre-commit run -a -v
  ```
---

## Troubleshooting

testing services inside a cluster

```bash
kubectl run multitool --image=praqma/network-multitool
toolPod=$(kubectl get pods -o json | jq -r ".items[].metadata | select(.name | contains (\"multitool\")).name")
kubectl exec -it $toolPod --  bash
```
