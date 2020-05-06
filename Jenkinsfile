node {

    /* we define commands inside a try */
  try {
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
        /* We'll push the image with two tags:
	        * First, the branch name and the latest tag
	        * Second, the branch name and the incremental build number
	        * Pushing multiple tags is cheap, as all the layers are reused. */
    }
  } catch(error){
      withCredentials([[$class: 'StringBinding', credentialsId: 'slack-webhook-url', variable: 'SLACK_URL']]) {
		    sh "curl -XPOST -d 'payload={ \"color\": \"danger\", \"text\": \":warning: Build failed: $error (see <${env.BUILD_URL}/console|the build logs>)\" }' ${env.SLACK_URL}"

    }

}