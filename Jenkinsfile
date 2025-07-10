// Jenkinsfile - FULL VERSION
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from source control...'
                git branch: 'main', url: 'https://github.com/YOUR_USERNAME/devsecops-fortress.git'
            }
        }

        stage('SAST Scan: Bandit') {
            steps {
                echo 'SECURITY GATE 1: Scanning Python code for vulnerabilities...'
                sh 'pip install bandit && bandit -r .'
            }
        }

        stage('IaC Scan: tfsec') {
            steps {
                echo 'SECURITY GATE 2: Scanning Terraform code...'
                // This command needs to be installed on the Jenkins server.
                // For now, we assume it is.
                sh 'tfsec .'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    // Use a unique build ID for the image tag
                    def dockerImage = "yourdockerhubusername/fortress:${env.BUILD_ID}"
                    sh "docker build -t ${dockerImage} ."
                }
            }
        }

        // We will add the Trivy Container Scan stage later, after configuring a registry.
    }
}