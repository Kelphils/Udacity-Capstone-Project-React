#install kubectl
curl -LO https://dl.k8s.io/release/v1.22.0/bin/linux/amd64/kubectl
chmod +x kubectl

mv kubectl /usr/local/bin
kubectl version --client

#install eksctl
yum install -y tar gzip

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin

eksctl version
#check if cluster exists on aws
CLUSTER_DETAILS="$(aws eks describe-cluster --name react-app)"

if [ $? -eq 0 ]; then
    echo "Cluster Exists!"
else
    echo "New Cluster Created"
fi
