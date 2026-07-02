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

        stage('Build Frontend') {
            steps {
                sh 'docker build -t $DOCKERHUB_USER/pro-frontend:v1 ./frontend'
            }
        }

        stage('Trivy Scan Backend') {
            steps {
              sh '''
              trivy image \
              --severity HIGH,CRITICAL \
              --exit-code 0 \
              sapna201/pro-backend:v1
              '''
             }
         }

         stage('Trivy Scan Frontend') {
            steps {
               sh '''
               trivy image \
               --severity HIGH,CRITICAL \
               --exit-code 0 \
               sapna201/pro-frontend:v1
               '''
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
