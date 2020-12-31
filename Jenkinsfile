pipeline {
  agent any

  parameters {
    choice(name: 'ENV', choices: ['', 'dev', 'prod'], description: 'Choose Environment')
  }

  environment {
    AWS_DEV = credentials('AWS-DEV')
    AWS_PROD = credentials('AWS-PROD')
  }

  stages {

    stage('Choose Env Credentials') {
      steps {
        script {
          if ( "${ENV}" == "dev" ) {
            env.AWS_ACCESS_KEY_ID = "${AWS_DEV_USR}"
            env.AWS_SECRET_ACCESS_KEY = "${AWS_DEV_PSW}"
          } else if ( "${ENV}" == "prod" ) {
            env.AWS_ACCESS_KEY_ID = "${AWS_PROD_USR}"
            env.AWS_SECRET_ACCESS_KEY = "${AWS_PROD_PSW}"
          }
        }
      }
    }

    stage('Terraform INIT') {
      steps {
        sh '''
          echo ${AWS_ACCESS_KEY_ID} | base64
          terraform init -backend-config=states/${ENV}.tfvars -no-color
        '''
      }
    }
  }
}