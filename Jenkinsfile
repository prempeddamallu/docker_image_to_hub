pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub' // Replace with your Jenkins credentials ID
        DOCKER_IMAGE_NAME = 'premdatagrokr/prem' // Format: <username>/<image_name>
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat "docker build -t ${DOCKER_IMAGE_NAME} ." // Use double quotes to allow variable expansion
                }
            }
        }
        stage('Run Docker Image') {
            steps {
                script {
                    // Run the Docker image
                    bat "docker run --name muni -d ${DOCKER_IMAGE_NAME}" // Use double quotes
                    
                    // Give it a moment to start
                    sleep(5)

                    // Fetch and print the logs
                    echo 'Container logs:'
                    bat "docker logs muni" // Use double quotes
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        // Push the Docker image
                        bat "docker push ${DOCKER_IMAGE_NAME}" // Use double quotes
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built, running, and pushed to Docker Hub successfully!'
        }
        failure {
            echo 'There was an error in the process.'
        }
        always {
            script {
                // Cleanup: stop and remove the container
                bat "docker stop muni || exit 0" // Use exit 0 for Windows
                bat "docker rm muni || exit 0" // Use exit 0 for Windows
                bat "docker rmi ${DOCKER_IMAGE_NAME}"
            }
        }
    }
}
