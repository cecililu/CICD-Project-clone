pipeline {
    agent any
    stages {
        stage("build docker image") {
            steps {
                sh 'echo  $USER'
                sh 'echo  $USER'
                sh 'pwd'
                sh 'sudo docker ps'
                sh "ls"
                script {
                    sh 'sudo docker build -t docker-cicd:v1 .'
                }
            }
        }
        stage("push docker image") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: '7c7b3c29-92bb-4719-824f-119246d72b78', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'sudo docker tag docker-cicd:v1 cecilghimirec/docker-cicd:v1'
                        sh 'sudo docker push cecilghimirec/docker-cicd:v1'

                     
                    }
                }
            }
        }
    }
}
