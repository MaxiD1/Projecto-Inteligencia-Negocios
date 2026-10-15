-- =====================================================================
-- Creacion del modelo dimensional Albarran_DW (mueblería Albarrán)
-- Script generado a partir del esquema real de la base Albarran_DW
-- (la misma que carga el ETL de SSIS: ETL/ETL_entrega).
-- Modelo en estrella: F_Ventas + 5 dimensiones.
-- Granularidad: una fila por linea de producto de un documento de venta.
-- Orden de ejecucion: dimensiones primero, hechos al final.
-- =====================================================================
USE master;
GO

IF DB_ID('Albarran_DW') IS NULL
    CREATE DATABASE Albarran_DW COLLATE Modern_Spanish_CI_AS;
GO

USE Albarran_DW;
GO

-- ---------------------------------------------------------------------
-- Eliminar tablas si existen (hechos primero por las FK)
-- ---------------------------------------------------------------------
IF OBJECT_ID('dbo.F_Ventas')    IS NOT NULL DROP TABLE dbo.F_Ventas;
IF OBJECT_ID('dbo.D_Cliente')   IS NOT NULL DROP TABLE dbo.D_Cliente;
IF OBJECT_ID('dbo.D_Producto')  IS NOT NULL DROP TABLE dbo.D_Producto;
IF OBJECT_ID('dbo.D_Sucursal')  IS NOT NULL DROP TABLE dbo.D_Sucursal;
IF OBJECT_ID('dbo.D_Tiempo')    IS NOT NULL DROP TABLE dbo.D_Tiempo;
IF OBJECT_ID('dbo.D_Vendedor')  IS NOT NULL DROP TABLE dbo.D_Vendedor;
GO

-- ---------------------------------------------------------------------
-- D_Cliente  (origen: clientes)
-- ---------------------------------------------------------------------
CREATE TABLE dbo.D_Cliente (
    cliente_id       INT           NOT NULL,
    nombre_completo  NVARCHAR(150) NOT NULL,
    sexo             NVARCHAR(50)  NOT NULL,
    fecha_nacimiento DATE          NOT NULL,
    estado_civil     NVARCHAR(50)  NOT NULL,
    CONSTRAINT PK_D_Cliente PRIMARY KEY (cliente_id)
);
GO

-- ---------------------------------------------------------------------
-- D_Producto  (origen: productos + categorias)
-- ---------------------------------------------------------------------
CREATE TABLE dbo.D_Producto (
    producto_id  INT            NOT NULL,
    nombre       NVARCHAR(50)   NOT NULL,
    descripcion  NVARCHAR(500)  NOT NULL,
    categoria    NVARCHAR(100)  NOT NULL,
    CONSTRAINT PK_D_Producto PRIMARY KEY (producto_id)
);
GO

-- ---------------------------------------------------------------------
-- D_Sucursal  (origen: sucursales + comunas)
-- ---------------------------------------------------------------------
CREATE TABLE dbo.D_Sucursal (
    sucursal_id  INT           NOT NULL,
    nombre       NVARCHAR(150) NOT NULL,
    comuna       NVARCHAR(150) NULL,
    CONSTRAINT PK_D_Sucursal PRIMARY KEY (sucursal_id)
);
GO

-- ---------------------------------------------------------------------
-- D_Tiempo  (origen: campo fecha de ventas). tiempo_id = yyyymmdd
-- ---------------------------------------------------------------------
CREATE TABLE dbo.D_Tiempo (
    tiempo_id  INT       NOT NULL,
    fecha      DATE      NOT NULL,
    dia        TINYINT   NOT NULL,
    mes        TINYINT   NOT NULL,
    [año]      SMALLINT  NOT NULL,
    CONSTRAINT PK_D_tiempo PRIMARY KEY (tiempo_id)
);
GO

-- ---------------------------------------------------------------------
-- D_Vendedor  (origen: empleados + cargos)
-- ---------------------------------------------------------------------
CREATE TABLE dbo.D_Vendedor (
    vendedor_id     INT           NOT NULL,
    nombre          NVARCHAR(200) NOT NULL,
    cargo           NVARCHAR(100) NOT NULL,
    fecha_contrato  DATE          NOT NULL,
    CONSTRAINT PK_D_vendedor PRIMARY KEY (vendedor_id)
);
GO

-- ---------------------------------------------------------------------
-- F_Ventas  (origen: ventas + detalle_ventas)
-- venta_id y tipo_documento son dimensiones degeneradas.
-- monto_bruto = cantidad * precio_unitario
-- monto_neto  = monto_bruto - descuento
-- ---------------------------------------------------------------------
CREATE TABLE dbo.F_Ventas (
    tiempo_id        INT            NOT NULL,
    producto_id      INT            NOT NULL,
    cliente_id       INT            NOT NULL,
    sucursal_id      INT            NOT NULL,
    vendedor_id      INT            NOT NULL,
    venta_id         INT            NOT NULL,
    tipo_documento   NVARCHAR(50)   NOT NULL,
    cantidad         INT            NOT NULL,
    precio_unitario  DECIMAL(18,2)  NOT NULL,
    descuento        DECIMAL(18,2)  NOT NULL,
    monto_bruto      DECIMAL(18,2)  NOT NULL,
    monto_neto       DECIMAL(18,2)  NOT NULL,
    CONSTRAINT PK_F_Ventas_1 PRIMARY KEY (producto_id, venta_id),
    CONSTRAINT FK_F_Ventas_D_Cliente   FOREIGN KEY (cliente_id)  REFERENCES dbo.D_Cliente  (cliente_id),
    CONSTRAINT FK_F_Ventas_D_Producto  FOREIGN KEY (producto_id) REFERENCES dbo.D_Producto (producto_id),
    CONSTRAINT FK_F_Ventas_D_Sucursal1 FOREIGN KEY (sucursal_id) REFERENCES dbo.D_Sucursal (sucursal_id),
    CONSTRAINT FK_F_Ventas_D_Tiempo1   FOREIGN KEY (tiempo_id)   REFERENCES dbo.D_Tiempo   (tiempo_id),
    CONSTRAINT FK_F_Ventas_D_Vendedor  FOREIGN KEY (vendedor_id) REFERENCES dbo.D_Vendedor (vendedor_id)
);
GO

-- ---------------------------------------------------------------------
-- Verificacion
-- ---------------------------------------------------------------------
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO
