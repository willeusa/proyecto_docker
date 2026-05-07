# **UD07 Laboratorio 01: Ecosistema Odoo \- Gestión Integral de Información (RA7)**

Este repositorio contiene la resolución del primer laboratorio de la **Unidad Didáctica 7**, enfocado en la arquitectura, integración y extracción de datos en un sistema ERP moderno utilizando **Odoo**.

El objetivo principal es cumplir con el **RA7**: Operar sistemas empresariales de gestión de información realizando tareas de importación, integración, aseguramiento y extracción de la información.

## **Preparación del Entorno**

Para el desarrollo de esta práctica, se ha utilizado un entorno orquestado con **Docker**:

* **Contenedores:** Odoo y PostgreSQL.  
* **Monitoreo:** Seguimiento de trazas en tiempo real mediante docker logs \-f odoo para observar el comportamiento del ORM y las peticiones HTTP.  
* **Modo Desarrollador:** Activado para la gestión técnica avanzada y depuración del esquema de datos.

## **Fases del Proyecto**

### **1\. Integración de Módulos y Carga de Datos**

* **Expansión del ERP:** Instalación de los módulos de **Inventario** y **Facturación**, observando la alteración dinámica del esquema relacional en PostgreSQL (CREATE TABLE, ALTER TABLE).  
* **Importación Masiva:** Uso de la herramienta nativa de Odoo para mapear y cargar datos sintéticos (clientes\_mock.csv).  
* **Validación:** Uso de la extensión *Rainbow CSV* para asegurar la integridad de los datos antes de la ingesta por el ORM.

### **2\. Flujo de Ciclo de Negocio**

Se ha completado un ciclo operativo completo para validar la interoperabilidad entre departamentos:

1. **Ventas:** Creación de presupuestos y pedidos.  
2. **Inventario:** Generación automática de albaranes de entrega para productos almacenables y gestión de reservas.  
3. **Contabilidad:** Activación de disparadores (_triggers_) lógicos para la creación de facturas y generación de asientos contables tras la validación de entrega.

### **3\. Personalización de Informes (QWeb/XML)**

Siguiendo la política de **no modificar el Core**, se ha personalizado la plantilla de impresión de pedidos:

* **Motor:** QWeb (XML \+ HTML \+ Bootstrap).  
* **Técnica:** Modificación mediante herencia de vistas y localización de nodos.  
* **Resultado:** Inyección de un bloque legal dinámico con estilos específicos (CSS inline) para asegurar el renderizado correcto en el motor wkhtmltopdf.

### **4\. Extracción y Business Intelligence**

* **Exportación Relacional:** Configuración de exportaciones en formato **CSV (RFC 4180\)** compatibles con importación.  
* **Gestión de Relaciones:** Desglose de campos **Many2one** (ej: country\_id/name) mediante JOINs automáticos de Odoo para obtener datos descriptivos en lugar de IDs numéricos.  
* **Integridad:** Validación de codificación **UTF-8** para garantizar la interoperabilidad con herramientas externas de Mailing o BI.

## **Tecnologías Utilizadas**

* **ERP:** Odoo 16.0+  
* **Base de Datos:** PostgreSQL  
* **Lenguajes:** XML (QWeb), Python (ORM), SQL  
* **Formatos de Intercambio:** CSV, PDF  
* **Infraestructura:** Docker & Docker-Compose

## **Criterios de Evaluación Cubiertos**

* **CE b:** Instalación y configuración de módulos.  
* **CE g:** Generación y personalización de informes técnicos.  
* **CE h:** Procedimientos de extracción y aseguramiento de la información.

### **¿Cómo usar este repositorio?**

1. Levanta el entorno con docker-compose up \-d.  
2. Accede a la interfaz de Odoo y activa el Modo Desarrollador.  
3. Los datos de prueba se encuentran en la carpeta /data.  
4. Las modificaciones de vistas están documentadas en la Fase 2 del manual de la práctica.

