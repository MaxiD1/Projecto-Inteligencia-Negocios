-- ============================================
-- Base de datos
-- ============================================
IF DB_ID('DW_Ventas') IS NULL
    CREATE DATABASE DW_Ventas;
GO

USE DW_Ventas;
GO

-- ============================================
-- Dimension tiempo
-- ============================================
CREATE TABLE dimension_tiempo (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    fecha DATE NOT NULL UNIQUE,
    dia INT NOT NULL,
    mes INT NOT NULL,
    anio INT NOT NULL
);
GO

-- ============================================
-- Dimension sucursal
-- ============================================
CREATE TABLE dimension_sucursal (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	sucursal VARCHAR(30) NOT NULL,
    comuna VARCHAR(30) NOT NULL
);
GO

-- ============================================
-- Dimension cliente
-- ============================================
CREATE TABLE dimension_cliente (
    id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    sexo VARCHAR(100) NOT NULL,
    fecha_nacimiento VARCHAR(30) NOT NULL,
	estado_civil VARCHAR(30) NOT NULL
);
GO

-- ============================================
-- Dimension vendedor
-- ============================================
CREATE TABLE dimension_vendedor (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	cargo VARCHAR(30) NOT NULL,
	fecha_contrato VARCHAR(30) NOT NULL
);
GO

-- ============================================
-- Dimension producto
-- ============================================
CREATE TABLE dimension_producto (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	descripcion VARCHAR(100) NOT NULL,
	categoria VARCHAR(30) NOT NULL,
	precio INT NOT NULL
);
GO

-- ============================================
-- Dimension venta
-- ============================================

CREATE TABLE dimension_venta (
    id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tipo_documento VARCHAR(30) NOT NULL,
    numero_documento INT NOT NULL,

    tiempo_id INT NOT NULL,
    cliente_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    sucursal_id INT NOT NULL,

    CONSTRAINT FK_venta_tiempo
        FOREIGN KEY (tiempo_id)
        REFERENCES dimension_tiempo(id),

    CONSTRAINT FK_venta_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES dimension_cliente(id),

    CONSTRAINT FK_venta_vendedor
        FOREIGN KEY (vendedor_id)
        REFERENCES dimension_vendedor(id),

    CONSTRAINT FK_venta_sucursal
        FOREIGN KEY (sucursal_id)
        REFERENCES dimension_sucursal(id)
);
GO

-- ============================================
-- Verificar tablas
-- ============================================

CREATE TABLE detalle_venta (
    id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,

    venta_id INT NOT NULL,
    producto_id INT NOT NULL,

    cantidad INT NOT NULL,
    precio_unitario INT NOT NULL,

    subtotal AS (cantidad * precio_unitario) PERSISTED,

    CONSTRAINT FK_detalle_venta
        FOREIGN KEY (venta_id)
        REFERENCES dimension_venta(id),

    CONSTRAINT FK_detalle_producto
        FOREIGN KEY (producto_id)
        REFERENCES dimension_producto(id),

    CONSTRAINT CK_detalle_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT CK_detalle_precio
        CHECK (precio_unitario >= 0)
);
GO

-- ============================================
-- Verificar tablas
-- ============================================
SELECT
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO