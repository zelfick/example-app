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
        docker.withRegistry('https://registry.hub.docker.com','dockerhubpwd'){
            app.push("${env.BRANCH_NAME}-latest")
            app.push("${env.BRANCH_NAME}-${env.BUILD_NUMBER}")  
            /* We'll push the image with two tags:
	         * First, the branch name and the latest tag
	         * Second, the branch name and the incremental build number
	         * Pushing multiple tags is cheap, as all the layers are reused. */
        }
    }

}