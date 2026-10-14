# KPIs estratégicos
Para realizar el diseño de Kimball, hace falta establecer cuales son las preguntas que el negocio necesita responder. Los KPIs propuestos serán las métricas clave que ayudarán al dueño de la mueblería en la toma de decisiones.

### 1. AOV - Average Order Value (Ticket Promedio de Venta)

- **Qué mide:** Cuanto gasta en promedio un cliente cada vez que realiza una compra en la mueblería.
- **Objetivo de Negocio:** Evaluar si estrategias como la venta cruzada (ej: ofrecer sillas cuando alguien compra una mesa) están funcionando. Si el ticket promedio sube, la empresa crece sin necesidad de nuevos clientes.
- **Fórmula:**

$$
\text{Ticket Promedio} = \frac{\sum{} \text{Monto Total}}{\text{Total de documentos unicos}}
$$

### 2. Rendimiento y Efectividad por Vendedor
- **Qué mide:** Ingresos generados por las ventas de cada vendedor individual.
- **Objetivo de Negocio:** Identificar a los mejores vendedores puede servir para esquemas de bono o para detectar personal de bajo rendimiento para tomar decisiones de recursos humanos
- **Fórmula:**

$$
\text{Rendimiento Vendedor} = \sum_{i=1}^{n}(\text{Cantidad}_i \cdot \text{Precio Unitario}_i) - \text{Descuento}_i
$$

### 3. Impacto de Descuentos sobre los Ingresos (%)
- **Qué mide:** Cómo afectan los descuentos en la ganancia real de la empresa.
- **Objetivo de Negocio:** Controlar la fuga de capital por descuentos excesivos y monitorear qué productos o qué empleados etán reduciendo el margen de ganancia de la mueblería.
- **Fórmula:**

$$
\text{\% de Impacto} = \left(\frac{\sum \text{Descuentos Aplicados}}{\sum (\text{Cantiad} \cdot \text{Precio Unitario})}\right) \cdot 100
$$

### 4. MoM - Month-over-Month (Crecimiento de Ventas Mensual)
- **Qué mide:** tasa de variación porcentual de los ingresos de un mes respecto al mes anterior.
- **Objetivo de Negocio:** Monitorear la salud general del crecimiento de la empresa e identificar patrones estacionales.
- **Fórmula:**

$$
\text{Crecimiento MoM} = \left(\frac{\text{Ingresos Mes Actual} - \text{Ingresos Mes Anterior}}{\text{Ingresos Mes Anterior}}\right) \cdot 100
$$