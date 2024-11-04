pipeline {
    agent any 

    stages {
        stage('Check Git Version') {
            steps {
                script {
                    // Print the Git version
                    def gitVersion = sh(script: 'git --version', returnStdout: true).trim()
                    echo "Git Version: ${gitVersion}"
                }
            }
        }
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/your-repo.git', branch: 'main'
            }
        }
    }
}
