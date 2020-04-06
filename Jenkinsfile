pipeline {
   agent any
   
   stages {
      stage('Download') {
         steps {
            git branch: "${BRANCH}", credentialsId: "${CREDENCIALES_GITHUB}", url: 'https://github.com/luishernandez25/easyTest'
         }
      }
      stage('Test') {
         steps {
            sh "mvn test"
         }
      }
   }
}
