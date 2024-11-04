pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t reddy_name .'
                }
                
            }
        }
    }

    post {
        success {
            echo 'Docker image built successfully!'
        }
        failure {
            echo 'There was an error building the Docker image.'
        }
    }
}
