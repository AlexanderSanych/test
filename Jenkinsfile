pipeline {
   agent {
        dockerfile {
            filename 'Dockerfile.build'
            args '-p 83:80'
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
