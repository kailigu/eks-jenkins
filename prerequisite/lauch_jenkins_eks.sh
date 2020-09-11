# Build Jenkins container
docker-compose up --build

# Create EKS cluster
eksctl create cluster -f eks-create.yml 

