
#check if cluster exists on aws
aws eks describe-cluster --name old-cluster 

if [ $? -eq 0 ]; then
    echo "Cluster Exists!"
else
#creates new cluster
    aws eks create-cluster \
   --region us-east-1 \
   --name old-cluster \
   --kubernetes-version 1.21 \
   --role-arn arn:aws:iam::852515165118:role/Eks-Cluster_role \
   --resources-vpc-config subnetIds=subnet-00602b66,subnet-7c44155d,subnet-a5dd89fa,subnet-f06d77bd,subnet-19fff217,securityGroupIds=sg-d266f7c9,endpointPublicAccess=true,endpointPrivateAccess=true
    echo "New Cluster Created"
fi
