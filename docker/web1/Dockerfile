FROM php:8.2-apache

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-install zip pdo pdo_mysql

# Activation du module rewrite d'Apache
RUN a2enmod rewrite

# Copie de la configuration Apache
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Définition du répertoire de travail
WORKDIR /var/www/html

# Copie des fichiers de l'application
COPY . .

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installation des dépendances PHP
RUN composer install --no-interaction --no-dev --optimize-autoloader

# Configuration des permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/var 