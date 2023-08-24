pipeline{
    agent any
     environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
     }
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
                sh 'mvn verify'
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
        environment {
        SONAR_URL = "http://34.201.116.83:9000"
      }
        
        steps {
        withCredentials([string(credentialsId: 'sonarqube', variable: 'SONAR_AUTH_TOKEN')]) {
          sh 'cd java-maven-sonar-argocd-helm-k8s/spring-boot-app && mvn sonar:sonar -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=${SONAR_URL}'
        
        }
    }
    }

stage('Docker build'){
        steps{
            sh'''
            echo "building docker image"
            docker build -t Himabindu/cicd-e2e:${BUILD_NUMBER} .
            '''
        }

    }
    stage('image push to dockerhub'){
        steps{
            sh'''
            echo "pushing docker image"
            docker push -t Himabindu/cicd-e2e:${BUILD_NUMBER} .
            '''
        }
    }

}
}
