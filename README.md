# Capstone Project for Udacity DevOps Nanodegree

This project fulfills the requirements of the Udacity DevOps Capstone Project. A web app is containerized and deployed to a kubernetes cluster. This react app runs on an eks cluster

# Getting Started with Create React App

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

1. K8s/ - This folder contains the kubernetes resource configuration files that will deploy the application image on AWS EKS using kubectl once configured properly.

2. CicleCi - This file contains the definition of the stages in the pipeline. The stages in this project's pipeline are Lint files, Building image, Upload Image to Docker hub, Remove Unused docker image, Update Kube Config and Deploy Updated Image to Cluster.

3. Dockerfile - This file contains all the commands needed to assemble the app image.

4. run_docker.sh - This file contains the shell commands needed to build the image on docker locally and also run a container.

5. run_kubernetes.sh - This file contains the shell commands needed to deploy the app in a kubernetes cluster running locally.

6. upload_docker.sh - This file contains the shell commands needed to upload the docker image to docker hub.

7. create_cluster.sh - This file creates a cluster with its managed nodes and also creates a namespace.

8. check_cluster.sh - This file installs eksctl on the machine and checks if a cluster is avaliable and if the cluster isn't avaliable it creates the cluster.

9. deploy_eks_cluster.sh - This file installs kubectl on the machine and gets the kubeconfig of the needed cluster, updates with the current image and deploys it to eks.

# Deploying on Amazon EKS using a CI/CD pipeline

1. Circleci to setup your CI/CD pipeline.

2. Once circleci is setup with the project on github, you'll need to set up jobs with the use of circleci images based on the one required to run the specific job on the pipeline.

3. The reason for setting up these jobs is to have the EKS module available for you. Once you setup these jobs with the required images you would be able to run Docker and AWS commands and the rest of the commands are setup to run in bash scripts.

4. You might need to store your sensitive information in the circleci enviroment variables for your pipeline to run smoothly. Note: This is the best security standard.

5. One of the stages in the pipeline requires Docker login information. You can set this up in circleci by saving it circleci enviroment variables in the project settings to match your repo on Docker hub.

6. Once all this is done you can start working more on the circleci as i used my bash scripts to install packages which were required like the eksctl and kubectl. Note your IAM user should have permissions to use EKS.

7 . Also set up the bash scripts to create my clusters and deploy the clusters to AWS EKS clusters.

8. A command line tool 'sed' is used in updating the kubernetes configuration file in other to force the pods to update with the new image. The reason for this is that Kubernetes (wrongly) considers Docker tags as immutable (i.e., once a tag is set, it is never changed). The rolling update is also activated by the change in image name.

9 . Applied a rolling deployment configuration in K8s/deployment.yaml file, so that the containers will be runnings on some pod while the deployment is taking place in another pod and when the new deployment is done the running pod is switched and old one is taken down. This is done to avoid less downtime while the application is running.

# Local Docker and Kubernetes Setup

To run this app using docker, a script has been attached that builds an image from the Dockerfile and spins up a container running the React app:

❍ ./run_docker.sh

There is also a script that uploads the Docker image to a designated repo. This should be edited before execution:

❍ ./upload_docker.sh

A script that deploys the Docker Image to a local Kubernetes Cluster is also available:

❍ ./run_kubernetes.sh

Please view the aforementioned scripts before running to understand the logic behind them.

Happy developing!
