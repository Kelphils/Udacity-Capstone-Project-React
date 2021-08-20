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
    eksctl create cluster \
        --name react-app \
        --version 1.21 \
        --with-oidc \
        --nodegroup-name react-app-nodegroup \
        --node-type t2.medium \
        --nodes 2 \
        --nodes-min 2 \
        --nodes-max 4 \
        --ssh-access \
        --ssh-public-key AWS_EC2_DEMO \
        --managed
    echo "New Cluster Created"
fi
