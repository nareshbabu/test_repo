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

                    docker.withRegistry('353771058964.dkr.ecr.ap-south-1.amazonaws.com/testrepo', 'ecr:ap-south-1:shared_account_Rupeek') {
                        def image = docker.build('testImageVersioning:latest')
                        image.push()
                        image.push(major)
                        image.push(minor)
                        image.push(patch)
                    }
                }
            }
        }
    }
}
