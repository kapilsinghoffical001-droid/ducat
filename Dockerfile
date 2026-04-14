# Base image
FROM ubuntu:24.04

# Non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache and git
RUN apt-get update && \
    apt-get install -y apache2 git && \
    apt-get clean

# Remove default Apache files
RUN rm -rf /var/www/html/*

# Clone your GitHub repo
RUN git clone https://github.com/kapilsinghoffical001-droid/kapil.git /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apachectl", "-D", "FOREGROUND"]
