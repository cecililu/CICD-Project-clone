pipeline {
    agent any
         stages {
           
              
                stage("build docker image"){
                    steps{
                         sh 'echo  $USER'
                         sh 'echo  $USER'
                         sh 'pwd'
                         sh 'docker ps'
                         
                        script{
                             sh 'docker build -t docker-cicd:v1 .'

                        }
                    }
                }
            
         }
 }
