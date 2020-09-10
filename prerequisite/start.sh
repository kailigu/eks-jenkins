# Create EKS cluster
eksctl create cluster -f eks-create.yml 

# Build Jenkins container
docker-compose up --build