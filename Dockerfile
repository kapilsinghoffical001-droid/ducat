# Base image
FROM ubuntu:24.04

# Non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache + wget + unzip
RUN apt-get update && \
    apt-get install -y apache2 wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Remove default Apache files
RUN rm -rf /var/www/html/*

# Download your GitHub repo as ZIP
RUN wget -q https://github.com/kapilsinghoffical001-droid/kapil/archive/refs/heads/master.zip && \
    unzip master.zip && \
    cp -r kapil-master/* /var/www/html/ && \
    rm -rf master.zip kapil-master

# Expose port
EXPOSE 80

# Start Apache
CMD ["apachectl", "-D", "FOREGROUND"]
