FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2 unzip wget

# Create web directory
RUN rm -rf /var/www/html/*

# Download template INSIDE container
RUN wget https://templatemo.com/download/templatemo_603_nexaverse -O /tmp/prem.zip \
    && unzip /tmp/prem.zip -d /tmp/site \
    && cp -r /tmp/prem/* /var/www/html/

CMD ["apache2ctl", "-D", "FOREGROUND"]
