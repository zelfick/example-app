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
        docker.withRegistry('https://registry.hub.docker.com','dockerhubaccess'){
            app.push("${env.BRANCH_NAME}-latest")
            app.push("${env.BRANCH_NAME}-${env.BUILD_NUMBER}")  
        }
    }

}