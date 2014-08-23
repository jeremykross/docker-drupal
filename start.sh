#!/bin/bash

echo "Starting SSHD"
/usr/sbin/sshd -D &

if [ -f /data/ssh-pw.txt ]; then
    echo "root:$(cat /data/ssh-pw.txt)" | chpasswd
fi

if [ -d /data/php5 ]; then
    rm -rf /etc/php5
    ln -s /data/php5 /etc/php5
fi

if [ -f /data/.htaccess ]; then
    rm -f /var/www/.htaccess
    ln -s /data/.htaccess /var/www/.htaccess
fi

if [ ! -e /root/drush-backups/archive-dump ]; then
    mkdir -p /data/backups/drush
    ln -s /data/backups/drush /root/drush-backups/archive-dump
fi

if [ ! -d /data/sites/default ]; then
    echo "Installing Drupal sites"
    cd /data; tar xzf /var/www/sites.tgz
fi
chown -R www-data:www-data /data/sites/
chmod -R a+w /data/sites/

if [ ! -f /data/sites/default/settings.php ]; then
    echo "Installing Drupal"

    cd /var/www/
    drush site-install standard -y --account-name=admin --account-pass=admin --db-url="${DB_TYPE}://${DB_USER}:${DB_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}"
fi

echo "Starting Supervisord"
supervisord -n
