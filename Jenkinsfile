pipeline{
    agent any
    stages{
        stage("git checkout"){
            steps{
                script{
                    git branch: 'main' , url: 'https://github.com/BandiHimabindu/Devops.git'

                }
            }
        }
        stage('unit testing'){
            steps{
                script{
                    sh 'mvn test'
                               
            }
        }
    }
    stage('integration testing'){
        steps{
            script{
                sh mvn verify
            }
        }
    }
    stage('maven build'){
       steps{
        script{
            sh 'mvn clean install'
        }
       }
    }
    stage('static code analysis'){
        steps{
            script{

            }
        }
    }


}
