pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub' // Replace with your Jenkins credentials ID
        DOCKER_IMAGE_NAME = 'your_dockerhub_username/prem' // Format: <username>/<image_name>
        CONTAINER_NAME = 'muni' // Define container name for reuse
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
                    bat "docker run --name ${CONTAINER_NAME} -d ${DOCKER_IMAGE_NAME}" // Use double quotes
                    
                    // Give it a moment to start
                    sleep(5)

                    // Fetch and print the logs
                    echo 'Container logs:'
                    bat "docker logs ${CONTAINER_NAME}" // Use double quotes
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
        stage('Clean Up') {
            steps {
                script {
                    try {
                        // Stop and remove the container
                        bat "docker stop ${CONTAINER_NAME} || exit 0"
                        bat "docker rm ${CONTAINER_NAME} || exit 0"
                        
                        // Optionally remove the Docker image after the pipeline completes
                        bat "docker rmi ${DOCKER_IMAGE_NAME} || exit 0"
                    } catch (Exception e) {
                        error "Failed to clean up Docker resources: ${e.message}"
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
    }
}
