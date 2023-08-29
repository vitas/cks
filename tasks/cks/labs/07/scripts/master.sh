#!/bin/bash
echo " *** master node  task 07"
kubectl taint nodes --all node-role.kubernetes.io/master- --kubeconfig=/root/.kube/config
kubectl taint nodes --all node-role.kubernetes.io/control-plane-  --kubeconfig=/root/.kube/config

export KUBECONFIG=/root/.kube/config
helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm install gatekeeper/gatekeeper --name-template=gatekeeper --namespace gatekeeper-system --create-namespace

kubectl  apply -f https://raw.githubusercontent.com/ViktorUJ/cks/master/tasks/cks/07/scripts/ConstraintTemplate_image_repo.yaml  --kubeconfig=/root/.kube/config
sleep 10

kubectl  apply -f https://raw.githubusercontent.com/ViktorUJ/cks/master/tasks/cks/07/scripts/K8sTrustedImages.yaml  --kubeconfig=/root/.kube/config