# Meotodologia del diseño (4 pasos de Kimball)

El objetivo es diseñar una propuesta de BI mediante un modelo dimensional que permita analizar los datos del modelo transaccional, optimizando las consultas y facilitando la toma de decisiones estratégicas por parte de la gerencia.

La metodología de diseño se basa en el enfoque Bottom-Up de Kimball, aplicando sus 4 pasos fundamentales sobre el modelo relacional origen.

## 1. Elección del Proceso de Negocio

El proceso de negocio central seleccionado es la gestión y ejecución de ventas.

**Justificación:** Representa la actividad comercial principal de la mueblería y el motor de sus ingresos. El análisis de este proceso permitirá responder a las preguntas críticas del negocio: qué se vende, quién lo compra, quién lo vende y dónde se vende, lo cual habilita la creación de los KPIs financieros y operativos.

## 2. Nivel de Granularidad

La granularidad de este proyecto será **una fila por cada línea de producto dentro de un documento de venta (boleta)**.

**Justificación:** Utilizar el registro del producto específico vendido en una transacción particular otorga la máxima flexibilidad. Permite realizar agrupaciones hacia cualquier nivel superior (por boleta, por día, por sucursal, etc) sin perder la capacidad de analizar el comportamiento individual de cada artículo.

## 3. Elección de las Dimensiones

Se consolidan las tablas normalizadas del origen para generar las siguientes dimensiones desnormalizadas:

- **Dim_Tiempo**
    - *Atributos:* Fecha, año, mes, día.
    - *Origen:* Derivada del campo `fecha` de la tabla transaccional `ventas`
- **Dim_Producto**
    - *Atributos:* SK_Producto, ID_Origen, nombre, descripcion, categoria, precio_lista
    - *Origen:* Integracion de las tablas `productos` y `categorias`
- **Dim_Sucursal**
    - *Atributos:* SK_Sucursal, ID_Origen, Nombre_Sucursal, Comuna
    - *Origen:* Integracion de las tablas `sucursales` y `comunas`
- **Dim_Empleado**
    - *Atributos:* SK_Empleado, ID_Origen, Nombre_Completo, Fecha_Contrato, Cargo.
    - *Origen:* Integracion de las tablas `empleados` y `cargos`
- **Dim_Cliente**
    - *Atributos:* SK_Cliente, ID_Origen, Nombre_Completo, Sexo, Fecha_Nacimiento, Estado_Civil
    - *Origen:* Tabla `clientes`

## 4. Identificación de Métricas y Tabla de Hechos

- **Nombre de la tabla:** `Fact_Ventas`
- **Origen de datos:** Cruce de lasa tablas `ventas` y `detalle_ventas`
- **Métricas identificadas:**
    1. Cantidad: unidades vendidas del producto (Aditiva)
    2. Precio Unitario: Valor del producto al momento de la venta (Semi-Aditiva)
    3. Descuento: Monto descontado en la línea de venta (Aditiva)
    4. Monto Total: Métrica generada durante el ETL mediante `(cantidad * precio_unitario) - descuento.
- **Dimensiones Degeneradas:** Se incluyen campos `numero_documento` y `tipo_documento` directamente en la tabla de hechos para la trazabilidad operativa (auditoria de boletas/facturas).
