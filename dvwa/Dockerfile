FROM vulnerables/web-dvwa:latest

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ---- crear logs durante la fase de build para evitar tocar permisos en runtime ----
USER root
RUN mkdir -p /var/log/apache2 \
    && touch /var/log/apache2/access.log /var/log/apache2/error.log \
    && chmod 664 /var/log/apache2/access.log /var/log/apache2/error.log \
    && chown -R www-data:www-data /var/log/apache2 || true
# (si la imagen original cambia el USER, puedes restaurarlo si es necesario)
# USER www-data
# ----------------------------------------------------------------------------------

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2ctl","-D","FOREGROUND"]
