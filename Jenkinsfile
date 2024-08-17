pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nsingh11144/cickd.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Specify the Dockerfile explicitly
                    dockerImage = docker.build("myapp:latest", "-f Dockerfile .")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        dockerImage.push("latest")
                    }
                    
                    sh 'helm upgrade --install myapp ./helm/myapp'
                }
            }
        }
    }
}
