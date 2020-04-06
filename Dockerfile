###############################################################
# Archivo DockerFile | ChallengeDevOps - Orange
# Nivel Docker Jenkins | Gabriel Calabria
###############################################################

# Imagen base a utilizar
FROM jenkins/jenkins:lts

# Autor
MAINTAINER Gabriel Calabria

# Cambio de usuario para ejecutar tareas de actualización e instalación
USER root

# Definición de variables de entorno para usar un servidor proxy HTTP o HTTPS para salir a Internet desde la imagen/contenedor
#ENV HTTP_PROXY "http://user:pass@server:port"
#ENV HTTPS_PROXY "https://user:pass@server:port"

# Actualización de fuentes de los repositorios y actualización de paquetes del sistema
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apt-utils && apt-get upgrade -y

# Instalación de Maven
RUN apt-get install -y maven

# Retorno al usuario regular de la imagen base
USER jenkins

# Copia de archivo desde el host a la imagen, donde se aumenta a 12 el numero de ejecutoroes
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Copia de archivo el host a la imagen, donde se indican los plugins de Jenkins a instalar
COPY plugins.txt /plugins.txt

# Instalación de los plugins de Jenkins requeridos
RUN /usr/local/bin/plugins.sh /plugins.txt

