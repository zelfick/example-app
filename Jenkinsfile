node {
    def app
    stage('Clone Repo'){
        checkout scm
    }
    stage ('Build Image'){
        app=docker.build('zelfick/example-app')
    }
    stage ('Push Image'){
        docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials'){
            app.push('latest')
        }
    }
}