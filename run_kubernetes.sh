# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="kelphils/react-capstone"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run my-running-app\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=3000 --labels app=my-running-app

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward my-running-app 3000:3000