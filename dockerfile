# Use the official Apache image from the Docker Hub
FROM httpd:alpine

# Copy the content of the project1 folder to the Apache web directory
COPY . /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
