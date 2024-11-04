pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat 'docker build -t reddy_name .'
                }
            }
        }
        stage('Run Docker Image') {
            steps {
                script {
                    // Run the Docker image
                    bat 'docker run --name redy_con -d reddy_name'
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built and running successfully!'
        }
        failure {
            echo 'There was an error building or running the Docker image.'
        }
    }
}
