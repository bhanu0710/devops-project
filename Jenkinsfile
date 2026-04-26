pipeline {
    agent any

    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
        IMAGE_NAME = "bhanu0710/backend-app"
    }

    stages {

       
        stage('Build Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:${BUILD_NUMBER} ./node-express-mongodb"
            }
        }

        stage('Push Image') {
            steps {
                sh "docker login -u $DOCKERHUB_CREDS_USR -p $DOCKERHUB_CREDS_PSW"
                sh "docker push $IMAGE_NAME:${BUILD_NUMBER}"
            }
        }

        stage('Update K8s YAML') {
            steps {
                sh """
                sed -i '' 's|backend-app:.*|backend-app:${BUILD_NUMBER}|g' k8s/backend-deployment.yaml
                """
            }
        }

        stage('Push Changes') {
            steps {
                sh """
                git config user.name "bhanu0710"
                git config user.email "brathore0710@gmail.com"
                git add .
                git commit -m "update image to ${BUILD_NUMBER}"
                git push
                """
            }
        }
    }
}
