Automated Deployment with through Docker Engine

 Pre-requisites
1. Jenkins: Ensure Jenkins is installed and running.
2. Docker: Ensure Docker is installed on the Jenkins server.
3. Docker Pipeline Plugin: Install the Docker Pipeline plugin in Jenkins.

 Steps
1. Create and Push Dockerfile
Ensure the `Dockerfile` with the following content is created and pushed to your repository:

   Dockerfile
Use the official Apache image from the Docker Hub

    FROM httpd:alpine

     #Copy the content of the project1 folder to the Apache web directory
    COPY . /usr/local/apache2/htdocs/

     #Set the ServerName directive globally to suppress the warning
    RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

     Expose port 80
    EXPOSE 80
   
    In Bash
    git add Dockerfile
    git commit -m "Add Dockerfile with ServerName directive"
    git push
   

2. Jenkins Pipeline Configuration
Create a Jenkins pipeline job with the following `Jenkinsfile`:

   In groovy script
    pipeline {
        agent any

        environment {
            DOCKER_IMAGE = "project1-apache"
            CONTAINER_NAME = "project1-container"
            HOST_PORT = "8000"
        }

        stages {
            stage('Clone Repository') {
                steps {
                    git 'https://github.com/mosesthummathati/project2.git'
                }
            }
            stage('Build Docker Image') {
                steps {
                    script {
                        sh 'docker build -t ${DOCKER_IMAGE} .'
                    }
                }
            }
            stage('Run Docker Container') {
                steps {
                    script {
                        sh '''
                        if [ $(docker ps -a -q -f name=${CONTAINER_NAME}) ]; then
                            docker rm -f ${CONTAINER_NAME}
                        fi
                        docker run -d -p ${HOST_PORT}:80 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}
                        '''
                    }
                }
            }
            stage('Test Application') {
                steps {
                    script {
                        sh '''
                        curl -f http://localhost:${HOST_PORT} || exit 1
                        '''
                    }
                }
            }
        }

        post {
            always {
                script {
                    echo 'Cleaning up...'
                    // Optional: Clean up Docker images and containers if needed
                }
            }
        }
    }
   

3. Create Jenkins Job

Open Jenkins and create a new pipeline job.
In the pipeline configuration, set the pipeline script to the above `Jenkinsfile` content.

4. Run the Jenkins Pipeline Job
Trigger the job manually or set up a webhook to trigger the job on code changes.
Monitor the job execution to ensure all steps complete successfully.

5. Verify Deployment
Open a web browser and navigate to `http://localhost:8000` (or `http://<your-public-ip>:8000` if deploying on a remote server) to verify the application is running.

 Troubleshooting

Jenkins Console Output: Check the console output of the Jenkins job for any errors.
Docker Container Logs: If there are issues, check the container logs using:

  In Bash
  docker logs project1-container
 
Firewall and Network Settings: Ensure that the firewall allows traffic on port 8000 and that network settings are correctly configured.

 Cleanup

Stop and Remove Docker Container: If needed, stop and remove the Docker container:

  In Bash
  docker stop project2-container
  docker rm project1-container
 

Remove Docker Image: If needed, remove the Docker image:

  In Bash
  docker rmi project1-apache
