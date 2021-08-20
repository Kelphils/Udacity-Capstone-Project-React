#install kubectl
curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
chmod +x kubectl

mv kubectl /usr/local/bin
kubectl version --client

# aws get kubeconfig
aws eks --region us-east-1 update-kubeconfig --name react-app

# get k8s nodes
kubectl get nodes