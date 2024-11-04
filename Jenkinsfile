pipeline {
    agent any 

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t hello-world-image .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    sh 'docker run --rm hello-world-image'
                }
            }
        }
    }
    post {
        success {
            echo 'Docker image built and container run successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
