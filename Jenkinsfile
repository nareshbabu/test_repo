pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    def version = readFile('VERSION')
                    def versions = version.split('\\.')
                    def major = versions[0]
                    def minor = versions[0] + '.' + versions[1]
                    def patch = version.trim()

                    docker.withRegistry('https://353771058964.dkr.ecr.ap-south-1.amazonaws.com/testrepo', 'ecr:ap-south-1:ECR_ACCESS') {
                        docker build('testrepo:latest')
                        docker push()
                        docker push(major)
                        docker push(minor)
                        docker push(patch)
                    }
                }
            }
        }
    }
}
