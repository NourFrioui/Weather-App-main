pipeline {
    agent any
    triggers{
        pollSCM('*/5 * * * *')
    }

    environment {
        // Initialisation de variables globales
        DOCKER_IMAGE_NAME = 'nourfrioui/weather-app'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Build Image') {
            steps {
                script {
                    // Build d'image
                    sh 'docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
    
                    sh 'npm install'
                    sh 'npm test' /
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    // Push vers DockerHub
                    withDockerRegistry(credentialsId: 'dockerhub-credentials', url: 'https://registry.hub.docker.com') {
                        sh 'docker push $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG'
                    }
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Nettoyage
                    sh 'docker rmi $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Perform additional actions here if needed.'
        }
        failure {
            echo 'Pipeline failed! Perform cleanup or additional actions here if needed.'
        }
    }
}