**﻿Descripción de archivos**

- *Dockerfile*: este archivo genera una imagen desde la base jenkins/jenkins:lts, realiza la instalación de Maven, establece la configuración de 12 ejecutores en Jenkins e instala los plugins requeridos para levantar el pipeline que ejecutará el job. Se incluyen lineas comentareadas para la salida a Internet a través de un proxy, las cuales deberían ajustarse de acuerdo al proxy local donde se genere la imagen y se levante el contenedor.

- *executors.groovy*: este archivo contiene el código necesario para la configuración de 12 ejecutores en Jenkins

- *docker-compose.yml*: este archivo genera el contenedor, establece el volumen compartido y abre los puertos para alcanzar desde el host a Jenkins

- *plugins.txt*: este archivo contiene el listado de todos los plugins a instalarse en Jenkins

- *Jenkinsfile*: este archivo declarativo descarga la rama y credenciales indicadas en el job y ejecuta en consola el comando "mvn test"



**Instrucciones: **

1)  Construir la imagen e iniciar un contenedor, de acuerdo a lo configurado en el archivo docker-compose.yml. Se debe estar ubicado en el directorio donde se encuentran los archivos relacionados al inicio:

*docker-compose up --build*

 2) Acceder a Jenkins desde un navegador Web, ingresando a la URL:

http://localhost:8080

Con el usuario **admin** y la contraseña que fue generada en el proceso de inicio del contenedor. Al crear el job, deben configurarse dos parámetros: uno de texto para indicar la rama desde la cual se va a realizar la descarga (clonación) del proyecto (debe nombrarse **BRANCH**) y otro con las credenciales para autenticarse en GitLab con el nombre **CREDENCIALES_GITHUB**.

3) A pesar de poder detenerse la ejecución del contenedor con la combinación de teclas **CTRL+C**, se recomienda ejecutar desde otra consola, el siguiente comando para también eliminar el contenedor. Se debe estar ubicado en el directorio donde se encuentran los archivos relacionados al inicio:

*docker-compose down*



***Notas generales***

No se encontró en la documentación oficial, la forma de configurar el numeral 1) del punto g), ya que corresponden a sintaxis diferentes (declarativa y guionizada).



***Fuentes utilizadas:***

https://docs.docker.com/

https://hub.docker.com/r/jenkins/jenkins/

https://github.com/jenkinsci/docker/blob/master/README.md

https://updates.jenkins-ci.org/download/plugins/

https://jenkins.io/doc/book/pipeline/jenkinsfile/

https://jenkins.io/doc/pipeline/
