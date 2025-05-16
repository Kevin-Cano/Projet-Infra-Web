FROM php:8.2-apache

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libicu-dev \
    && docker-php-ext-install zip pdo pdo_mysql intl

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configuration d'Apache
RUN a2enmod rewrite

# Définition du répertoire de travail
WORKDIR /var/www/html

# Copie des fichiers de l'application
COPY . .

RUN if [ -f /var/www/html/public/htaccess.txt ]; then mv /var/www/html/public/htaccess.txt /var/www/html/public/.htaccess; fi

# Ajout de la configuration git safe.directory pour éviter les erreurs de propriété
RUN git config --global --add safe.directory /var/www/html

# Installation des dépendances Symfony
RUN composer install --no-interaction --optimize-autoloader

# Configuration des permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/var

# Copie de la configuration Apache
COPY docker/web1/000-default.conf /etc/apache2/sites-available/000-default.conf 