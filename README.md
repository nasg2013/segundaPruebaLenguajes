# segundaPruebaLenguajes

Para el examen se implemento autentificación, autorización, consultas privadas a profesores y respuestas
de parte de los profesores.Además las vistas de login, sign-up, inquiry y inquiry-response.

Link de reposotorio en github:
https://github.com/nasg2013/segundaPruebaLenguajes

Link de Trello con lista de tareas:
Tarjeta titulada "EXAMEN-CRUD consultas privadas":

https://trello.com/b/B434cB7B/proyecto2lenguajes

En el repositorio titulado "segundaPruebaLenguajes" se encuentran:

1-Carpeta "webApp": La cual contiene el proyecto de front-end en Angular.
segundaPruebaLenguajes\webApp\src\app\.., acá basicamente encontramos las siguentes carpetas:

components: contiene el navbar
guards: contiene el archivo de manejo de autentificaciones
models: entidades usadas en el proyecto
pages: vistas que se muestran segun ruta especificada
services: contiene archivos que se encarga de la persistencia y lectuta de datos

1.1-Inicialmente al ejecutar la app de angular ~/segundaPruebaLenguajes/ng serve
Lo primero que aparece es el login  donde nos pide que ingresemos un correo y una clave:

Aunque el app registra nuevos usuarios no se ha implementado el módulo de asignación de roles por lo que se debe ingresar con las
siguentes credenciales:

Role Estudiante:
Correo: nestorsg1@hotmail.com Clave:12345678
Correo: nestorsg1@hotmail.com Clave:12345678

Como estudiante se puede navegar:
http://localhost:4200/home: "Inicio"
http://localhost:4200/inquiry: "Hacer consultas"

Role Teacher:
Correo: teacher@teacher.com clave: 12345678
Correo: esteban@ucr.com clave: 12345678

Como profesor se puede navegar:
http://localhost:4200/home: "Inicio"
http://localhost:4200/inquiry: "Hacer consultas"
http://localhost:4200/inquiry-response: "Responder consultas"


2-Carpeta "Api": Contiene API de SpringBoot a partir de REST.
segundaPruebaLenguajes\Api\src\main\java\com\example\..

carpeta principal:
controller: Expone los métodos que pueden ser consultados

InquiryController:
GET: Obtiene todas las consultas: http://localhost:8080/api/inquiry/getAll
GET: Obtiene una consulta por id: http://localhost:8080/api/inquiry/{id}
POST: Guarda una consulta: http://localhost:8080/api/inquiry/{Inquiry}

InquiryResponseController:
GET: Obtiene todas las respuestas: http://localhost:8080/api/inquiryresponse/getAll
GET: Obtiene una respuesta de una consulta por id: http://localhost:8080/api/inquiryresponse/{id}
POST: Guarda una respuesta : http://localhost:8080/api/inquiryresponse/{InquiryResponse}

UsersController:
GET: Obtiene todas las respuestas: http://localhost:8080/api/users/getAll
GET: Obtiene una respuesta de una consulta por id: http://localhost:8080/api/users/id/{id}
POST: recibi un correo y clave, verifica que este loguiado si lo esta devuelve los datos : http://localhost:8080/api/users/login
POST: Guarda un usuario : http://localhost:8080/api/users/{Users}

3-Además se adjunta un archivo "sql.sql" que es el respaldo de la base de datos.
La base esta alojada en el servidor de la UCR: 163.178.107.10, nombre de base de datos "LaboratorioMVC_SPRING_BOOT_A95777_2020".
Para la parte de autentificación y autorización se cuenta con una tabla Users,Role("Admin","Teacher","Student") y UsersRole.
Además para las noticias estan las tablas Inquiry, InquiryResponse.











