
#check if cluster exists on aws
aws eks describe-cluster --name capstone-cluster 

if [ $? -eq 0 ]; then
    echo "Cluster Exists!"
else
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
fi
