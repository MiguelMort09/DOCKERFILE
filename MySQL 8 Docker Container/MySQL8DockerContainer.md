# MySQL 8 Docker Container

Este proyecto proporciona dos formas de desplegar una base de datos MySQL 8 personalizada utilizando Docker: una con un `Dockerfile` y otra utilizando `Docker Compose`. Ambas opciones incluyen configuraciones predeterminadas para crear un contenedor MySQL con un usuario, contraseña y base de datos predeterminados, y con persistencia de datos mediante un volumen.

## Dockerfile

### Contenido del `Dockerfile`

```Dockerfile
# Usar la imagen oficial de MySQL 8 como base
FROM mysql:8

# Establecer las variables de entorno para MySQL
ENV MYSQL_ROOT_PASSWORD=myrootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Crear un volumen para persistencia de datos
VOLUME /var/lib/mysql

# Exponer el puerto 3306 para MySQL
EXPOSE 3306

# El contenedor se ejecutará con la configuración predeterminada de MySQL
CMD ["mysqld"]
```

### Explicación del Dockerfile

1. **`FROM mysql:8`**: Utiliza la imagen oficial de MySQL 8 como base.
2. **`ENV`**:
    - `MYSQL_ROOT_PASSWORD`: Contraseña del usuario `root` de MySQL.
    - `MYSQL_DATABASE`: Nombre de la base de datos que se crea automáticamente al iniciar el contenedor.
    - `MYSQL_USER` y `MYSQL_PASSWORD`: Se crean un usuario personalizado con su respectiva contraseña.
3. **`VOLUME /var/lib/mysql`**: Crea un volumen persistente para almacenar los datos de la base de datos, asegurando que los datos no se pierdan si el contenedor se elimina.
4. **`EXPOSE 3306`**: Expone el puerto `3306`, el puerto por defecto de MySQL, para que puedas conectarte al contenedor desde tu máquina local.
5. **`CMD ["mysqld"]`**: El contenedor ejecutará el servicio de MySQL al iniciar.

## Instrucciones para Dockerfile

### Paso 1: Construir la imagen

1. Guarda el `Dockerfile` en un directorio vacío.
2. Abre una terminal y navega a ese directorio.
3. Ejecuta el siguiente comando para construir la imagen personalizada de MySQL:

```bash
docker build -t mysql-custom .
```

### Paso 2: Ejecutar el contenedor

Una vez que la imagen esté construida, puedes ejecutar el contenedor con el siguiente comando:

```bash
docker run -d -p 3306:3306 --name mysql-container mysql-custom
```

Este comando ejecutará el contenedor en segundo plano (`-d`), expondrá el puerto `3306` para conectarse a MySQL desde tu máquina local y asignará el nombre `mysql-container` al contenedor.

### Paso 3: Conectarse a la base de datos

Una vez que el contenedor esté en funcionamiento, puedes conectarte a la base de datos MySQL utilizando las siguientes credenciales:

- **Host**: `localhost` (o la IP del contenedor si se ejecuta en una red diferente)
- **Usuario**: `myuser`
- **Contraseña**: `mypassword`
- **Base de datos**: `mydatabase`

### Paso 4: Volúmenes de persistencia

Los datos de MySQL se almacenarán de manera persistente en el volumen asignado en `/var/lib/mysql`. Esto asegura que, incluso si el contenedor se elimina, los datos de la base de datos no se perderán.

---

## Intrucciones para docker-compose.yml


### Paso 1: Usar Docker Compose para levantar el contenedor

1. Guarda el archivo `docker-compose.yml` en un directorio vacío.
2. Abre una terminal y navega a ese directorio.
3. Ejecuta el siguiente comando para levantar el contenedor:

```bash
docker-compose up --build -d
```

Esto descargará la imagen de MySQL, creará y ejecutará el contenedor, y lo pondrá en segundo plano.

### Paso 2: Conectarse a la base de datos

Una vez que el contenedor esté en funcionamiento, puedes conectarte a la base de datos MySQL utilizando las siguientes credenciales:

- **Host**: `localhost` (o la IP del contenedor si se ejecuta en una red diferente)
- **Usuario**: `myuser`
- **Contraseña**: `mypassword`
- **Base de datos**: `mydatabase`

### Paso 3: Volúmenes de persistencia

Al igual que en la opción con `Dockerfile`, los datos de MySQL se almacenarán de manera persistente en el volumen asignado (`mysql-data`), lo que asegura que los datos no se pierdan si el contenedor se elimina.

---

## Personalización

Si necesitas ajustar las configuraciones predeterminadas, puedes modificar las siguientes variables de entorno en cualquiera de las opciones:

- `MYSQL_ROOT_PASSWORD`: La contraseña del usuario `root` de MySQL.
- `MYSQL_DATABASE`: El nombre de la base de datos que se crea al inicio.
- `MYSQL_USER`: El nombre del usuario personalizado que se crea.
- `MYSQL_PASSWORD`: La contraseña del usuario personalizado.

Para cambios adicionales, como puertos o configuraciones avanzadas, simplemente edita el `Dockerfile` o el `docker-compose.yml` y reconstruye la imagen o reinicia el contenedor.

## Notas

- En ambos casos, el contenedor expone el puerto `3306`, por lo que debes asegurarte de que este puerto no esté en uso en tu máquina local antes de ejecutar el contenedor.
- Si deseas ejecutar múltiples instancias de MySQL, asegúrate de mapear puertos diferentes o crear contenedores con configuraciones distintas.

## Recursos adicionales

- [Documentación oficial de MySQL Docker](https://hub.docker.com/_/mysql)
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)