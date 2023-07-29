pipeline {
    agent any
         stages {
           
              
                stage("build docker image"){
                    steps{
                         sh 'echo  $USER'
                         sh 'echo  $USER'
                         sh 'pwd'
                         sh 'sudo docker ps'
                         
                        script{
                             sh 'sudo docker build -t docker-cicd:v1 .'

                        }
                    }
                }
            
         }
 }
