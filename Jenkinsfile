pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "bindusabavath/sample:kubeimage1"
        DOCKER_USERNAME = "bindusabavath"
        DOCKER_PASSWORD = "Charan@2004"   // Consider using Jenkins credentials instead of plain text
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image..."
                bat "docker build -t kubedemoapp:v1 ."
            }
        }

        stage('Docker Login') {
            steps {
                echo "Logging in to Docker Hub..."
                bat "docker login -u %DOCKER_USERNAME% -p %DOCKER_PASSWORD%"
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                echo "Tagging and Pushing Docker Image..."
                bat "docker tag kubedemoapp:v1 %DOCKER_IMAGE%"
                bat "docker push %DOCKER_IMAGE%"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "Deploying to Kubernetes..."
                bat "kubectl apply -f deployment.yaml --validate=false"
                bat "kubectl apply -f service.yaml"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully "
        }
        failure {
            echo "Pipeline failed "
        }
    }
}
