pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    def version = readFile('VERSION')
                    def versions = version.split('\\.')
                    def major = 'DEV' + versions[0]
                    def minor = versions[0] + '.' + versions[1]
                    def patch = version.trim()

                    docker.withRegistry("https://353771058964.dkr.ecr.ap-south-1.amazonaws.com/testrepo", "ecr:ap-south-1:ecr_Temp") {
                        def image = docker.build('testrepo:latest')
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
