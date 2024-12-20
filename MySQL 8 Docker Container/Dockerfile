# Usar la imagen oficial de MySQL 8 como base
FROM mysql:8

# Establecer las variables de entorno para MySQL
ENV MYSQL_ROOT_PASSWORD myrootpassword
ENV MYSQL_DATABASE mydatabase
ENV MYSQL_USER myuser
ENV MYSQL_PASSWORD mypassword

# Crear un volumen para persistencia de datos
VOLUME /var/lib/mysql

# Exponer el puerto 3306 para MySQL
EXPOSE 3306

# El contenedor se ejecutará con la configuración predeterminada de MySQL
CMD ["mysqld"]
