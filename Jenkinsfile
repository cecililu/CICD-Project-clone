pipeline {
    agent{ 
        label "agent-node"
    }
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
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'sudo docker tag docker-cicd:v1 cecilghimirec/docker-cicd:v1'
                        sh 'sudo docker push cecilghimirec/docker-cicd:v1'

                     
                    }
                }
            }
        }
         stage('Run ansible playook to deploy container in servers') {
            agent {
                label "agent-node" // Specific agent for the 'Build' stage
            }
            steps {
                    sh 'cd /home/vagrant/ansible/ansible_docker_'
                    sh "ls /home/vagrant/ansible/ansible_docker_ "
                    sh 'pwd'
                    sh "ls"
                    sh "whoami"
                    // Run the Ansible playbook using the ansible-playbook command
                    dir( "/home/vagrant/ansible/ansible_docker_"){
                        sh "ls"
                    sh "pwd"
                    sh "sudo su"    
                    sh 'ansible-playbook run_role.yaml'
                    }    
            }
        }
    }
}
