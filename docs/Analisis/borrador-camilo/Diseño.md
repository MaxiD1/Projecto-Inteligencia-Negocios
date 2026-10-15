


# Modelo dimensional 

## Proceso de negocio
	
Según los KPI ¿qué actividad de la empresa genera los datos que necesito para mis KPI?

El proceso es la venta de muebles.



## Granularidad

Una fila representara un producto vendido dentro de un documento de venta

## Dimensiones

D_tiempo: 	ventas.fecha

D_producto: productos + categorias

D_cliente: clientes

D_sucursal: sucursales + comunas

D_vendedor: empleados + cargos


## Medidas:

Medidas directas: cantidad, precio_unitario, descuento.

Medidas calculadas: onto bruto = cantidad × precio unitario; 
monto neto = monto bruto − descuento


Clasificaciones:
	aditiva: cantidad, montos
	no aditiva: precio unitario

Dimensiones generadas: datos del documento que no merecen tabla propia
(venta_id, tipo_documento, numero_documento). Se guardan en el hecho.

