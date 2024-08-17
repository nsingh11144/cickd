pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Corrected missing comma between parameters
                git url: 'https://github.com/nsingh11144/cickd.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    dockerImage = docker.build("myapp:latest")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Run tests inside the Docker container
                    dockerImage.inside {
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Push Docker image to a container registry (optional)
                    docker.withRegistry('https://your-registry-url', 'your-credentials-id') {
                        dockerImage.push("latest")
                    }
                    
                    // Deploy to Kubernetes using Helm
                    sh 'helm upgrade --install myapp ./helm/myapp'
                }
            }
        }
    }
}
