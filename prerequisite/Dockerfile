FROM jenkins/jenkins

USER root

# Intall tidy
RUN apt-get update && \
    apt-get install -y tidy 

# Install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
    unzip awscliv2.zip && \
    ./aws/install && \
    aws --version

# Install eksctl
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp &&\
    mv /tmp/eksctl /usr/local/bin &&\
    eksctl version

# Install kubectl
RUN curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl &&\
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin &&\
    kubectl version --short --client

USER jenkins


