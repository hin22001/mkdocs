properties([
        disableConcurrentBuilds()
])

/************** Container Parameters *********************/
def PYTHON_CONTAINER = 'python'
def PYTHON_IMAGE = 'python:3.7.6-buster'

def DOCKER_CONTAINER = 'docker'
def DOCKER_IMAGE = 'docker:20.10.2-dind'
/************** Container Parameters *********************/

podTemplate(yaml:$/
    apiVersion: v1
    kind: Pod
    spec:
      containers:
      - name: $PYTHON_CONTAINER
        image: $PYTHON_IMAGE
        imagePullPolicy: Always
        tty: true
        securityContext:
          privileged: true
        command: ["cat"]
      - name: $DOCKER_CONTAINER
        image: $DOCKER_IMAGE
        imagePullPolicy: Always
        tty: true
        securityContext:
          privileged: true
        command: ["dockerd"]
/$
) {
    node(POD_LABEL) {

        try {
            stage('Checkout Source') {
                checkout scm
            }
                
            stage('Install dependencies') {
                dir("${env.WORKSPACE}") {
                    container(PYTHON_CONTAINER) {
                        sh 'pip install mkdocs'
                    }
                }                
            }
                
            stage('Build') {
                dir("${env.WORKSPACE}") {
                    container(PYTHON_CONTAINER) {
                        sh 'mkdocs build'
                    }
                }
            }

            stage('Test') {
                echo 'Some unit test should be conducted in this stage'
            }

            def timestamp = (new Date()).format("yyyyMMddHHmmss")
            def image = "mkdocs:${timestamp}"
            
            stage('Containerize') {
                container(DOCKER_CONTAINER) {        
                    sh "docker build -t hin22001/${image} ."
                }
            }

            stage('Security Scan') {
                echo 'impletment a security scan tools to proceed security scanning'
                // sysdig engineCredentialsId: 'sysdig-secure-api-credentials', name: 'image', inlineScanning: true
            }

            stage('Deploy image') {
                container(DOCKER_CONTAINER) {
                    sh 'docker login -u hin22001 -p 4d040400-33a1-4ed0-932c-16f692996a1d'
                    sh "docker push hin22001/${image}"
                }
            }
                
        } catch (err) {
            /* Some exception handling */
            throw err
        }
    }
}
