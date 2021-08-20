#install kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl

chmod +x ./kubectl

mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

#install eksctl
yum install -y tar gzip

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin

eksctl version
#check if cluster exists on aws
aws eks describe-cluster --name capstone-cluster 
if [ $? -eq 0 ]; then
    echo "Cluster Exists!"
else
    eksctl create cluster \
        --name capstone-cluster \
        --region us-east-1 \
        --name react-app \
        --node-type t2.large \
        --nodes 3 \
        --nodes-min 2 \
        --nodes-max 4 \
        --ssh-access \
        --ssh-public-key AWS_EC2_DEMO \
        --managed
    echo "New Cluster Created"
fi
