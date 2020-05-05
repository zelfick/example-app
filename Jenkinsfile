node {
    def app
    stage('Clone Repo'){
        checkout scm
    }
    stage ('Build Image'){
        app=docker.build('zelfick/example-app')
    }
    stage ('Test'){
        app.inside {
            sh 'npm test'
        }
    }
    stage ('Push Image'){
          docker.withRegistry('https://643909698763.dkr.ecr.us-east-1.amazonaws.com/','ecr:us-east-1:edxproject'){
            app.push("${env.BRANCH_NAME}-latest")
            app.push("${env.BRANCH_NAME}-${env.BUILD_NUMBER}")
        /*Use AWS Credentials plugin and AWS API credentials to generate a token that 
         docker can use to connect to ECR*/  

        }
    }

}