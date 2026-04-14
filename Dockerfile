FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Apache + wget + unzip
RUN apt-get update && \
    apt-get install -y apache2 wget unzip && \
    apt-get clean

# Remove default files
RUN rm -rf /var/www/html/*

# Download ZIP from GitHub
RUN wget https://github.com/kapilsinghoffical001-droid/kapil/archive/refs/heads/master.zip

# Unzip it
RUN unzip master.zip

# Move files to web directory
RUN cp -r kapil-master/* /var/www/html/

# Expose port
EXPOSE 80

# Start Apache
CMD ["apachectl", "-D", "FOREGROUND"]
