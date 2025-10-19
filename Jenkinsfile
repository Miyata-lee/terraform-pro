pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')   // the ID you gave in Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull your GitHub repo
                git branch: 'main', url: 'https://github.com/Miyata-lee/terraform-pro.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Optional: see what Terraform will do
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the Terraform changes automatically
                sh 'terraform apply'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
