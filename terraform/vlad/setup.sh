#!/bin/bash
echo "enter your volterra p12 password"
read -s API_PW
export VES_P12_PASSWORD="${API_PW}"
terraform init
terraform fmt
terraform validate
terraform plan
# apply
read -p "Press enter to continue"
terraform apply --auto-approve
mkdir -p ~/.kube/
cp ./kubeconfig_vb-sk70 ~/.kube/cluster-config
export KUBECONFIG=$KUBECONFIG:~/.kube/cluster-config
