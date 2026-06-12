pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'sapna201'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Backend') {
            steps {
                sh 'docker build -t $DOCKERHUB_USER/pro-backend:v1 ./backend'
            }
        }

        stage('Trivy Scan Backend') {
            steps {
                sh 'trivy image --severity HIGH,CRITICAL $DOCKERHUB_USER/pro-backend:v1'
            }
        }

        stage('Build Frontend') {
            steps {
                sh 'docker build -t $DOCKERHUB_USER/pro-frontend:v1 ./frontend'
            }
        }

        stage('Trivy Scan Frontend') {
            steps {
                sh 'trivy image --severity HIGH,CRITICAL $DOCKERHUB_USER/pro-frontend:v1'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Backend') {
            steps {
                sh 'docker push $DOCKERHUB_USER/pro-backend:v1'
            }
        }

        stage('Push Frontend') {
            steps {
                sh 'docker push $DOCKERHUB_USER/pro-frontend:v1'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan'
                }
            }
        }
      stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
     stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/sapnacloudengineer/cloud-native-ecommerce-platform'
            }
        }

     stage('Deploy to Kubernetes') {
            steps {
                sh '''
                ls -R
                kubectl apply -f k8s/
                '''
            }
        }
    }
}
