# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="kelphils/react-capstone"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
# Authenticate & tag
docker login -u kelphils -p ${}
docker tag proj-app $dockerpath:latest

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest