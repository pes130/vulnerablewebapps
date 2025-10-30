# mutillidae/Dockerfile
FROM webpwnized/mutillidae:www-2.12.5

# copia entrypoint personalizado
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
