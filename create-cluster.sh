# create cluster with nodes
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
        
        
# create a namespace for the cluster created

kubectl create ns udacity-capstone-proj
