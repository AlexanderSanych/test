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
               if ($(docker images -q nginx)) {
                  sh 'docker run -dit --name sn -p 80:80 san_nginx'
               } else {
                  echo "NNNNNNNN"
               }
               
            }
        }
        stage('step 3 test') {
            steps {
                sh 'echo AAAAA!!!!!'
            }
        }
    }
}
