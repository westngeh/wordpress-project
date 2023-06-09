# Use the official WordPress image as the base image
FROM wordpress:latest

# Set the work directory to the WordPress installation folder
WORKDIR /var/www/html

# Copy the WordPress files into the container
COPY . .

# Set the ownership and permissions for WordPress files
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Install additional PHP extensions if needed
# RUN docker-php-ext-install <extension_name>

# Expose port 80 to allow incoming traffic
EXPOSE 80

# Set the entrypoint to start Apache server
ENTRYPOINT ["apache2-foreground"]