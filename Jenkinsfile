pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('All Terraform Stages') {
            steps {
                // Wrap all Terraform commands with AWS credentials
                withCredentials([
                    string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    script {
                        // Checkout
                        git branch: 'main', url: 'https://github.com/Miyata-lee/terraform-pro.git'

                        // Terraform Init
                        sh 'terraform init'

                        // Terraform Plan
                        sh 'terraform plan'

                        // Approval before apply
                        input message: 'Approve Terraform Apply?'

                        // Terraform Apply
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
        success {
            echo 'Terraform deployment completed successfully! ✅'
        }
        failure {
            echo 'Pipeline failed 😢'
        }
    }
}
