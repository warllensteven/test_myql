# SALISKACAMPUS - Gestión de ALQUILER DE PELICULAS

## Descripción del Proyecto

este es un proyecto que busca el manejo y gestion de clientes,peliculas yempleados de un almacen de alquiler d epeliculas

## Requisitos del Sistema

Para ejecutar este proyecto, necesitas:

- MySQL 8.0 o superior
- Cliente MySQL Workbench o cualquier otro gestor de bases de datos compatible
- Visual Studio Code (opcional, pero recomendado para trabajar con los scripts SQL)

## Instalación y Configuración

Sigue estos pasos para configurar la base de datos:

1. **Crear la estructura de la base de datos**  
   Ejecuta el archivo `ddl.sql` en MySQL para crear todas las tablas necesarias.

2. **Cargar los datos iniciales**  
   Ejecuta el archivo `dml.sql` para insertar los datos en la base de datos.

3. **Verificar la estructura y datos cargados**  
   Puedes listar las tablas con:

   SHOW TABLES;


## Ejemplos de Consultas

Algunas consultas que pueden ejecutarse en el sistema:

1. **Listar todos los parques con su departamento correspondiente**

   ```sql
   SELECT p.nombre AS parque, d.nombre AS departamento
   FROM parque p
   JOIN departamento_parque dp ON p.id = dp.id_parque
   JOIN departamento d ON dp.id_departamento = d.id;
   ```


   ```




## Contribuciones

Este proyecto fue desarrollado con enfoque en la gestión eficiente de parques naturales. Si deseas contribuir, puedes clonar el repositorio y enviar mejoras.

## Licencia y Contacto

Este proyecto es de codigo abierto y puede ser utilizado y modificado libremente
Para dudas o consultas, contacta a: **warlenromero14@gmail.com**