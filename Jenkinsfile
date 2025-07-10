// Jenkinsfile - LEAN VERSION FOR TESTING
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Executing Stage 1: Checking out code...'
                git branch: 'main', url: 'https://github.com/AyushxOD/devsecops-fortress.git'
                echo 'Stage 1 Complete.'
            }
        }

        stage('SAST Scan: Bandit') {
            steps {
                echo 'Executing Stage 2: Scanning Python code...'
                // This is a lightweight scan to test system stability.
                sh 'pip install bandit && bandit -r .'
                echo 'Stage 2 Complete.'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}