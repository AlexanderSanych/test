pipeline {
   agent {
        dockerfile {
            filename 'Dockerfile'
            args '-p 80:80'
        }
    }

    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
