pipeline {
   agent any
    stages {
        stage('step 1 build') {
            steps {
                sh 'docker build -t san_nginx .'
            }
        }
        stage('step 2 run'){
            steps {
                  sh 'docker run -dit --name sn -p 80:80 san_nginx'
            }
        }
        stage('step 3 test') {
            steps {
                sh 'echo AAAAA!!!!!'
            }
        }
    }
}
