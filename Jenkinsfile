pipeline {
    agent any

    stages {

        stage('Git Clone') {
            steps {
                git 'https://github.com/sapnacloudengineer/cloud-native-ecommerce-platform'
            }
        }

        stage('Build Backend') {
            steps {
                sh 'docker build -t pro-backend ./backend'
            }
        }

        stage('Build Frontend') {
            steps {
                sh 'docker build -t pro-frontend ./frontend'
            }
        }
    }
}
