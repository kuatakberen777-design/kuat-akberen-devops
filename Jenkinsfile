pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Akberen'
        STUDENT_SURNAME = 'Kuat'
        STUDENT_GROUP   = 'IT2-2313'
        STUDENT_ID      = '000000'
        IMAGE_NAME      = 'kuat-akberen-devops'
        CONTAINER_NAME  = 'kuat-akberen-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
            }
        }

        stage('Build') {
            steps {
                sh 'ls -la'
                sh 'bash -n scripts/Kuat_Akberen_system.sh'
                sh 'python3 -m py_compile app/app.py'
                echo 'Build check passed'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f Kuat_Akberen_info.txt'
                sh 'test -f Dockerfile && test -f docker-compose.yml'
                sh 'cd app && python3 -m unittest -v test_app.py'
                sh 'bash scripts/Kuat_Akberen_system.sh'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
                sh 'docker images ${IMAGE_NAME}'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f ${CONTAINER_NAME} || true'
                sh '''
                    docker run \
                      -e STUDENT_NAME=${STUDENT_NAME} \
                      -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                      -e STUDENT_GROUP=${STUDENT_GROUP} \
                      -e STUDENT_ID=${STUDENT_ID} \
                      --name ${CONTAINER_NAME} \
                      ${IMAGE_NAME}
                '''
                sh 'docker ps -a --filter name=${CONTAINER_NAME}'
                sh 'docker logs ${CONTAINER_NAME}'
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully' }
        failure { echo 'Pipeline failed — check the stage logs above' }
    }
}
