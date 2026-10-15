


## Bocetos de kpi



---------------
ventas netas o ventas
-------------
¿Por que?: Es lo que más le importa al dueño saber: cuanto esta vendiendo.
Es un valor numerico calculable, venido del precio unitario y de descuentos
--------------
Unidades vendidas
--------------
¿Por que?: Base de la cantidad vendidas de producto.
sirve para ver si cambio el precio o el volumen de stock.
--------------
numero de ventas
-------------
¿Por que?: ventas guardadas documentadas por venta, para contar transacciones
--------------
Ventas promedio o ticket promedio
-------------
¿Por que?: Para comparar las sucursales y a los vendedores en especifico;
calculable con el total vendido y numero de ventas
--------------
Perfil de cliente
--------------
¿Por que?: datos del cliente para encuestas, campañas o saber el publico del producto:
sexo, fecha de naciemiento y estado civil.


Posibles adicciones:



Descuento total y % de descuento: detalle_ventas tiene un campo descuento. Sirve para ver si se está rebajando demasiado.

Ventas por sucursal y comuna: ventas tiene la sucursal y sucursales tiene la comuna. Sirve para saber dónde reforzar o dónde abrir.

Ventas por vendedor y cargo: ventas tiene el vendedor y empleados tiene el cargo. Sirve para medir desempeño.

Ventas por categoría y producto: productos está ligado a categorias. Sirve para saber qué se vende más y qué casi no se mueve.




## Datos disponibles

- ventas: fecha, cliente, vendedor, sucursal, tipo y número de documento

- detalle_ventas: producto, cantidad, precio unitario, descuento.

- productos y categorias: nombre, precio, categoría

- clientes: sexo, fecha de nacimiento, estado civil

- sucursales y comunas: sucursal y comuna

- empleados y cargos: nombre, cargo, fecha de contrato