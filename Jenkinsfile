pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git 'https://your-repository-url.git'
      }
    }
    stage('Build') {
      steps {
        script {
          dockerImage = docker.build("myapp:latest")
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
