pipeline {
   agent any
    stages {
        stage('step 1') {
            steps {
                sh 'docker build -t san_nginx .'
            }
        }
        stage('step 2'){
            steps {
                sh 'docker run -dit --name sn -p 80:80 san_nginx'
            }
        }
        stage('step 3') {
            steps {
                sh 'echo AAAAA!!!!!'
            }
        }
    }
}
