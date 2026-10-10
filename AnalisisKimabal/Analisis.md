


Analisis de kpi 

En base a los posibles KPI de KPI.md

¿Tiene utilidad?

### Ventas

Campos de tabla: venta_id, fecha, cliente_id, vendedor_id, 
	sucursal_id, tipo_documento, numero_documento

KPI que lo avalan: Número de ventas, ventas por mes y
	Ticket promedio.

SI

### detalle_ventas 

Campos de tabla: venta_id, producto_id, cantidad, precio_unitario, descuento

KPI que lo avalan: numero de ventas, ticket promedio y Descuento total

SI

### productos


Campos de tabla: producto_id, nombre, descripcion, categoria_id

KPI que lo avalan: Ventas, Ventas por producto

SI

### categorias

Campos de tabla: categoria_id, categoria

KPI que lo avalan: Ventas por categoría

SI

### clientes

Campos de tabla:	cliente_id, nombre, apellidos,
sexo, fecha_nacimiento, estado_civil

KPI que lo avalan: Perfil de cliente

Debatible, no es primario en proceso de negocio

### sucursales

Campos de tabla: sucursal_id, sucursal, comuna_id

KPI que lo avalan: Ventas por sucursal

SI

### Comunas

Campos de tabla: comuna_id, comuna

KPI que lo avalan: Ventas por sucursal

Debatible, KPI no lo usamos oficialmente

### Empleados

Campos de tabla: empleado_id, nombre, apellidos, fecha_contrato, cargo_id

KPI que lo avalan: Ventas por vendedor

Debatible, KPI no lo usamos oficialmente

### Cargos

Campos de tabla: cargo_id, nombre

KPI que lo avalan: Ventas por vendedor

Debatible, KPI no lo usamos oficialmente



### Datos que no usamos 
 - productos.precio: precio actual, redundante por estar el detalle_venta.precio_unitario,
 con el precio que se vende cada producto.

Empleados.Sueldo_base: no se tiene en cuenta en los KPI, no es necesario en el proceso de negocio y es informacion sensible

### KPI que no aparecen en la tabla
Utilidad: No se tiene en cuenta el costo del producto al ser adqquirido para su muestra y venta

Stock: no hay inventario de productos

Ubicacion del cliente: clientes no tiene comuna ni direccion


#Veredicto de Utilidad

Lo que refleja esta tabla es el proceso de venta puro de la venta y locacion, sin tomar en cuenta otros factores como stock
y tomando en cuenta otros que puede que no sea necesario conocer


## Calidad de los datos

### detalle_ventas





