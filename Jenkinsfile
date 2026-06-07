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

    stage('Docker Login') {
        steps {
            withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
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
}

}
