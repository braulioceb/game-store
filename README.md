# 🎮 Game Store Database

Base de datos relacional desarrollada en **MySQL** para la gestión de una tienda de videojuegos. Este proyecto permite administrar clientes, productos, ventas e inventario mediante un modelo relacional sencillo y escalable.

## 📋 Descripción General

La base de datos `game_testing` está diseñada para almacenar información relacionada con:

* Clientes registrados.
* Productos disponibles en la tienda.
* Historial de ventas realizadas.
* Control de inventario y reposición de stock.

## 🗂️ Estructura del Proyecto

```text
game-store/
├── dashboards                # dashboards
│   └── Power BI   # documentos de referencias a los archivos .pbix
├── data                 
│   ├── inputs         # datos de entrada
│   ├── raw            # datos crudos
│   ├── outputs        # datos finales
│   └── process        # datos procesados previos a los outpus finales
├── notebooks          # python notebooks      
├── reports            # libretas o documentos apuntando a reportes productivos. 
├── src                # archivos fuente .sql, .py, .sas para la ejecución del modelo 
│   ├── game-store-anlt     # archivos sql para el analisis
│   └── game-store     # archivos sql para generar la base game store 
├── .env.example       # template variables de ambiente
├── .gitignore         # archivo para ignorar archivos no requeridos
├── README.md          # documentación general 
└── requirements.yml   # dependencias del python
```

## 🛠️ Tecnologías Utilizadas

* MySQL 8.x
* SQL

---

# 📊 Modelo de Base de Datos

## 1. Tabla: `clients`

Almacena la información de los clientes de la tienda.

| Campo      | Tipo        | Descripción                     |
| ---------- | ----------- | ------------------------------- |
| id_client  | INT (PK)    | Identificador único del cliente |
| first_name | VARCHAR(50) | Nombre del cliente              |
| last_name  | VARCHAR(50) | Apellido del cliente            |
| age        | INT         | Edad del cliente                |
| date_born  | DATE        | Fecha de nacimiento             |

### Clave Primaria

* `id_client`

---

## 2. Tabla: `products`

Contiene la información de los videojuegos o productos disponibles para la venta.

| Campo       | Tipo          | Descripción                      |
| ----------- | ------------- | -------------------------------- |
| prod_id     | INT (PK)      | Identificador único del producto |
| prod_name   | VARCHAR(100)  | Nombre del producto              |
| prod_import | DECIMAL(10,2) | Precio del producto              |
| prod_desc   | VARCHAR(255)  | Descripción del producto         |

### Clave Primaria

* `prod_id`

---

## 3. Tabla: `sales`

Registra todas las ventas realizadas por los clientes.

| Campo         | Tipo          | Descripción                   |
| ------------- | ------------- | ----------------------------- |
| purchase_id   | INT (PK)      | Identificador de la compra    |
| id_client     | INT (FK)      | Cliente que realizó la compra |
| prod_id       | INT (FK)      | Producto vendido              |
| purchase_date | DATE          | Fecha de compra               |
| prod_num      | INT           | Cantidad comprada             |
| import        | DECIMAL(10,2) | Importe total de la venta     |

### Clave Primaria

* `purchase_id`

### Claves Foráneas

* `id_client` → `clients(id_client)`
* `prod_id` → `products(prod_id)`

---

## 4. Tabla: `inventory`

Gestiona el inventario y control de stock de los productos.

| Campo             | Tipo                     | Descripción                              |
| ----------------- | ------------------------ | ---------------------------------------- |
| inventory_id      | INT (PK, AUTO_INCREMENT) | Identificador del registro de inventario |
| prod_id           | INT (FK)                 | Producto asociado                        |
| stock_quantity    | INT                      | Cantidad disponible                      |
| min_stock         | INT                      | Stock mínimo                  |
| max_stock         | INT                      | Stock máximo                  |
| unit_cost         | DECIMAL(10,2)            | Costo unitario del producto              |
| warehouse_section | VARCHAR(50)              | Sección del almacén                      |
| supplier_name     | VARCHAR(100)             | Nombre del proveedor                     |
| last_restock      | DATE                     | Fecha del último reabastecimiento        |

### Clave Primaria

* `inventory_id`

### Clave Foránea

* `prod_id` → `products(prod_id)`

---

# 🔗 Relaciones entre Tablas

```text
clients
   │
   └───< sales >──── products
                         │
                         │
                         ▼
                    inventory
```

### Relaciones

* Un cliente puede realizar múltiples compras.
* Un producto puede aparecer en múltiples ventas.
* Cada producto puede tener un registro asociado en inventario.
* La tabla `sales` funciona como entidad transaccional entre clientes y productos.

---

# 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/usuario/game-store-database.git
cd game-store-database
```

### 2. Ejecutar el script SQL

Importar el archivo desde MySQL Workbench.

---

# 📈 Posibles Mejoras

* Agregar tabla de categorías de videojuegos.
* Incorporar empleados y sucursales.
* Implementar historial de movimientos de inventario.
* Gestionar múltiples proveedores por producto.
* Añadir métodos de pago y facturación.
* Limpiar la tabla de costos. 

---

# 📄 Licencia