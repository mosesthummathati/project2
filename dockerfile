# Use the official Apache image from the Docker Hub
FROM httpd:alpine

# Copy the content of the project1 folder to the Apache web directory
COPY . /usr/local/apache2/htdocs/

# Set the ServerName directive globally to suppress the warning
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

# Expose port 80
EXPOSE 80

