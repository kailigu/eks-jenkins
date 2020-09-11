## Prerequist environment setup

Run **prerequisite\launch_jenkins_eks.sh** to implement: 

1. A Docker container that include Jeknins, awsctl, eksctl, kubectl, docker.
2. An EKS cluster with a nodegroup

Other files located in \prerequisite:
 - eks-create.yml: Configuration file for creating EKS cluster
 - Dockerfile: Dockerfile for Jenkins container with awscli, eksctl, kubectl, docker tools.
 - docker-compose.yml: docker-compose file to start up the container
 - start-env.sh: CMD script for container to start Jenkins and Docker deamon

Jekins plugins could be put under a folder \jenkins_home to be mapped to \var\jenkins_home in Jekins Container.

## Jenkins pipeline

There are 6 stages outlined in Jenkinsfile:

![img](pipeline.png)

1. Lint HTML - lint index.html that's copied to nginx container
2. Build image - build docker image for nginx container
3. Deploy image - deploy docker image to docker hub
4. Apply blue deployment to AWS Load Balancer - deploy /deployment/blue.yml to eks cluster
5. Apply green deployment to AWS Load Balancer - deploy /deployment/green.yml to eks cluster
6. Remove blue deployment from AWS Load Balancer - remote /deployment/blue.yml from eks cluster





