FROM serversideup/php:8.3-fpm-nginx

# 1. Set working directory bawaan image
WORKDIR /var/www/html

# 2. Salin seluruh file proyek ke container dengan permission www-data
COPY --chown=www-data:www-data . .

# 3. Jalankan composer install untuk mengoptimalkan performa production
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# 4. Expose port internal container (Image ini menggunakan port 8080 secara default)
EXPOSE 8080
