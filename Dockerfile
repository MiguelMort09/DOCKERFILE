# Usar la imagen oficial de MySQL 8 como base
FROM mysql:8

# Establecer las variables de entorno para MySQL
ENV MYSQL_ROOT_PASSWORD=devsoft09
ENV MYSQL_DATABASE=portfolio
ENV MYSQL_USER=devmort
ENV MYSQL_PASSWORD=devSoftMort09

# Crear un volumen para persistencia de datos
VOLUME /var/lib/mysql

# Exponer el puerto 3306 para MySQL
EXPOSE 3306

# El contenedor se ejecutará con la configuración predeterminada de MySQL
CMD ["mysqld"]
