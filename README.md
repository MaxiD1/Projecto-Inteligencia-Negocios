# Proyecto-Inteligencia-Negocios

Este proyecto posee la siguiente estructura:

```
root/
|-ETL/
|  |-ETL_entrega/
|-database/
|     |-Albarran/
|     |-backup/
|     |-scripts/
|-docs/
|   |-Analisis/
|   |-Caso/
|   |-modelo-dimensional/
|   |-presentacion/
```

```ETL``` Contiene todos los archivos relacionados con la ETL.

```database``` Contiene los archivos de la base de datos del proyecto, incluyendo el archivo del proyecto creado en SQL Server Management Studio, respaldos de las bases de datos (tanto la original del caso como la creada por el script del modelo dimensional) y los scripts utilizados durante el proceso; por el momento solo contiene el script para crear la base de datos según nuestro modelo dimensional.

Para utilizar el script hay que crear un proyecto nuevo, o cargar el proyecto en este repositorio, en SQL Server Management Studio, conectarse a una base de datos local y cargar el script en SSMS y ejecutarlor.

```docs``` Contiene distintos documentos relacionados con el caso, desde las instrucciones del caso, la presentación de nuestra solución, un diagrama del modelo dimensional y archivos markdown con el análisis Kimball y los KPI.
