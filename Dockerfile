FROM wordpress:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install less -y

COPY ./html/wp-content /var/www/html
COPY ./html/wp-config.php /var/www/html
COPY ./html/.htaccess /var/www/html

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv /bin/wp-cli.phar /bin/wp
RUN chmod +x /bin/wp