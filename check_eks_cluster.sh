


#install kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl

chmod +x ./kubectl

mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
#check if cluster exists on aws
yum install -y tar
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

eksctl version
#creates new cluster
    eksctl create cluster \
    --name test-cluster \
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
