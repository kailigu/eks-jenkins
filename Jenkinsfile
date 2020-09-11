pipeline {
    environment {
    registry = "kailigu/devops-capstone"
    registryCredential = 'docker-hub'
    }
    
    agent any
    stages {
        
        stage ('Lint HTML') {
            steps {
                sh 'tidy -q -e *.html'
            }
        }

        stage('Building image') {
            steps {
                script {
                    sh 'docker build --tag=kailigu/devops-capstone .'
                }
            }
        }

        stage('Deploy Image') {
            steps {
                script {
                    withDockerRegistry([ credentialsId: "docker-hub", url: "" ]) {
                    sh 'docker push kailigu/devops-capstone'
                    }
                }
            }
        }

        stage ('Apply blue deployment to AWS Loadbalancer') {
            steps {
               script {
                    withAWS(credentials: 'aws-credentials', region: 'ap-southeast-2'){
                   sh "aws eks --region ap-southeast-2 update-kubeconfig --name capstone-eks"
                   sh 'kubectl apply -f deployment/blue.yml'
                   sh 'kubectl get pods'
                  }
               }
            }
        }

        stage ('Apply green deployment to AWS Loadbalancer') {
            steps {
               script {
                   withAWS(credentials: 'aws-credentials', region: 'ap-southeast-2'){
                   sh 'kubectl apply -f deployment/green.yml'
                   sh 'kubectl get pods'
                   }
               }
            }
        }

        stage ('Remove blue deployment from AWS Loadbalancer') {
            steps {
               script {
                   withAWS(credentials: 'aws-credentials', region: 'ap-southeast-2'){
                   sh 'kubectl delete deployment green-deployment'
                   sh 'kubectl get pods'
                   }
               }
            }
        }
    }
}