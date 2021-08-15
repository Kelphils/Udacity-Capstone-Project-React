# Build Image
docker build --tag=my-running-app . 

# List docker images
docker image ls

# Run flask app
docker run -p 3000:3000 my-running-app