# MySQL 8 Docker Container

Este proyecto proporciona dos formas de desplegar una base de datos MySQL 8 personalizada utilizando Docker: una con un `Dockerfile` y otra utilizando `Docker Compose`. Ambas opciones incluyen configuraciones predeterminadas para crear un contenedor MySQL con un usuario, contraseña y base de datos predeterminados, y con persistencia de datos mediante un volumen.

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