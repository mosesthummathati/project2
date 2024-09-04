1. Introduction to DevOps :
DevOps Overview:
Definition: DevOps is a practice that integrates software development (Dev) and IT operations (Ops) to shorten the development life cycle and ensure continuous delivery with high quality.
Importance: DevOps accelerates software releases, ensures high availability, and improves collaboration between development and operations teams.
Web Hosting Basics:
Web Servers: Responsible for delivering web content to users.
NGINX: A high-performance web server known for efficiency, stability, and low resource usage.
2. Workshop Tools & Technologies:
Ubuntu: A widely-used Linux distribution.
NGINX: A powerful HTTP server and reverse proxy server.
UFW (Uncomplicated Firewall): A tool for managing firewall rules.
Jenkins: An automation server for continuous integration and deployment.
Git: Version control for tracking code changes.
GitHub: A platform for hosting and collaborating on Git repositories.
Hands-On Activities
Step 1: Set Up GitHub Account and Git Configuration
Create a GitHub Account: Sign up for a GitHub account and set up Git on your local system to collaborate and manage repositories.
Fork a Repository: Learn how to fork a repository and clone it for local development.
Step 2: Set Up Azure VM and SSH
Connect to the VM: Use PowerShell or Command Prompt to SSH into the Azure VM using the public IP address.
Set Up SSH Authentication: Generate an SSH key, add it to GitHub, and test the connection to securely interact with GitHub.
Step 3: Install Git and Configure Git Remotes
Install Git: Use apt to install Git on Ubuntu.
Working with Remotes: Add remote repositories and clone your forked repository locally.
Webpage Deployment Process
Step 4: Install NGINX and Configure UFW
Install NGINX: Use apt to install NGINX and verify its status.
Configure Firewall: Use UFW to allow HTTP (port 80) and HTTPS (port 443) traffic to enable web access.
Modify NGINX Configuration: Update the NGINX configuration to serve the HTML webpage and ensure it's accessible from the browser.
Step 5: Deploy Webpage on NGINX
Move Web Files: Move your HTML and CSS files to the NGINX web directory (/var/www/html), set appropriate permissions, and test the deployment by accessing it in the browser.
CI/CD with Jenkins
Step 6: Install Jenkins
Install Jenkins: Use apt to install Jenkins and enable it to start on boot.
Configure UFW for Jenkins: Allow Jenkins to communicate on port 8080 and ensure OpenSSH is enabled for remote access.
Step 7: Configure Jenkins and Automate Deployment
Access Jenkins: Access the Jenkins UI via the browser, unlock it using the admin password, and install the required plugins (e.g., Git, Pipeline, Docker).
Set Up CI/CD Pipeline: Create a Jenkins Pipeline to clone the GitHub repository, deploy the HTML webpage on NGINX, and automate the process. The pipeline script will automate tasks like copying files, setting permissions, and restarting NGINX after deployment.
NGINX Configuration for Port 8081
Step 8: Reconfigure NGINX for Jenkins Deployment
Update NGINX Port: Reconfigure NGINX to listen on port 8081, and ensure that the root directory points to the correct web files location.
Set Permissions: Give the Jenkins user the necessary permissions to modify the web files during deployment without a password.
Working with GitHub Webhooks for Continuous Deployment
Step 9: Set Up Webhooks
GitHub Webhooks: Configure GitHub to trigger Jenkins builds via webhooks on repository changes. This automates the deployment process each time new changes are pushed to the repository.
Step 10: Deploy HTML Webpage Using Jenkins and NGINX
Jenkins Pipeline: Use a Jenkinsfile to define the deployment pipeline that pulls code from the GitHub repository, copies files to the NGINX directory, and reloads the NGINX server.
Access the Webpage: Access the deployed webpage via http://your_server_ip:8081 after a successful deployment.
Conclusion
At the end of this workshop, participants will have learned:

How to set up an Ubuntu VM and use it for web hosting.
Installation and configuration of NGINX for serving web pages.
Firewall management using UFW.
Automation of deployments using Jenkins.
Git version control basics and integration with Jenkins for CI/CD pipelines.
This workshop is a practical introduction to DevOps practices that includes deploying, securing, and automating web applications using industry-standard tools.
