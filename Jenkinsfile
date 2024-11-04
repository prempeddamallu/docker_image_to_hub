pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat 'docker build -t your_docker_image_name .'
                }
            }
        }
        stage('Run Docker Image') {
            steps {
                script {
                    // Run the Docker image
                    bat 'docker run --name reddyp -d your_docker_image_name'
                    
                    // Give it a moment to start
                    sleep(5)

                    // Fetch and print the logs
                    echo 'Container logs:'
                    bat 'docker logs reddyp'
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
        always {
            script {
                // Cleanup: stop and remove the container
                bat 'docker stop reddyp || true'
                bat 'docker rm reddyp || true'
            }
        }
    }
}
