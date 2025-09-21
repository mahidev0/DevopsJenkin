pipeline {
    agent any
    environment {
        IMAGE = "mahidev0/devopsjenkin:${BUILD_NUMBER}"
    }
    stages {
        stage('Checkout') {
            steps { git 'git@github.com:mahidev0/DevopsJenkin.git' }
        }
        stage('Build Docker Image') {
            steps { sh 'docker build -t $IMAGE .' }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push $IMAGE'
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker stop web || true && docker rm web || true'
                sh 'docker run -d --name web -p 80:80 $IMAGE'
            }
        }
    }
}

