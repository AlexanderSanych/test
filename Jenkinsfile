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
                sh 'if [ "$(docker images -q san_nginx)" ]; then docker run -dit --name sn -p 80:80 san_nginx else echo "No such images" fi'
            }
        }
        stage('step 3') {
            steps {
                sh 'echo AAAAA!!!!!'
            }
        }
    }
}
