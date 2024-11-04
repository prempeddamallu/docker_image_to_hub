pipeline {
    agent any 

    environment {
        DOCKER_IMAGE_NAME = 'hello-world-image'
        GIT_REPO_URL = 'https://github.com/prempeddamallu/hello-world-docker.git' // Update with your repo URL
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                git url: "${GIT_REPO_URL}"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    sh "docker run --rm ${DOCKER_IMAGE_NAME}"
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
