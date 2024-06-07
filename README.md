# proyectoDB
El objetivo de este proyecto es desarrollar un sistema de gestión de base de datos avanzada para un taller automotriz, utilizando MySQL, que permita administrar de manera eficiente todos los aspectos operativos del taller. Este sistema centralizará
la información de clientes, vehículos, servicios, reparaciones, empleados, proveedores, citas, inventarios, órdenes de compra y facturación, asegurando la integridad y consistencia de los datos a través de técnicas de normalización.

## Modelo conceptual.
![](./img/modelo_conceptual.png)
## Modelo relacional.
![](./img/modelo_relacional.png)

## Consultas requeridad.
1. Obtener el historial de reparaciones de un vehículo específico.
    ```sql
        SELECT *
        from reparacion as RE
        WHERE RE.vehiculo_id = 1;
    ```
    ```
        +---------------+------------+-------+-------------+-----------------------+-------------+-------------+-------------+
        | id_reparacion | fecha      | horas | costo_total | descripcion           | vehiculo_id | empleado_id | servicio_id |
        +---------------+------------+-------+-------------+-----------------------+-------------+-------------+-------------+
        |             1 | 2020-06-01 |     4 |   200000.00 | Reparación del motor  |           1 |           1 |           1 |
        +---------------+------------+-------+-------------+-----------------------+-------------+-------------+-------------+
    ```
    **Explicaciòn:** Recorro la entidad *reparacion* buscando el vehiculo con *id* "1".

1. Calcular el costo total de todas las reparaciones realizadas por un empleado específico en un período de tiempo.
    ```sql
        SELECT *
        FROM reparacion as RE
        WHERE RE.empleado_id = 2 AND fecha BETWEEN '2019-01-01' AND '2022-01-01'; 
    ```
    ```
        +---------------+------------+-------+-------------+------------------------------------+-------------+-------------+-------------+
        | id_reparacion | fecha      | horas | costo_total | descripcion                        | vehiculo_id | empleado_id | servicio_id |
        +---------------+------------+-------+-------------+------------------------------------+-------------+-------------+-------------+
        |             2 | 2019-06-02 |     5 |   250000.00 | Reparación de frenos               |           2 |           2 |           3 |
        |             7 | 2020-06-07 |     4 |   200000.00 | Reparación del sistema eléctrico   |           7 |           2 |           3 |
        +---------------+------------+-------+-------------+------------------------------------+-------------+-------------+-------------+

    ```
    **Explicaciòn:** Recorro la entidad *reparacion* seleccionando las reparaciones del *empleado* con *id* "2" realizadas entre el 2019 y el 2022.

1. Listar todos los clientes y los vehículos que poseen
    ```sql
        SELECT CONCAT(CL.nombre, ' ', CL.apellido) AS 'Cliente', CONCAT(VH.placa, ' ', VH.modelo) AS 'Vehiculo'
        FROM cliente AS CL
        INNER JOIN vehiculo AS VH ON CL.id_cliente = VH.cliente_id;
    ```
    ```
        +-------------------+----------------+
        | Cliente           | Vehiculo       |
        +-------------------+----------------+
        | Juan García       | ABC123 Corolla |
        | María López       | DEF456 Civic   |
        | Pedro Martínez    | GHI789 Fiesta  |
        | Ana Sánchez       | JKL012 Spark   |
        | Luis González     | MNO345 Accent  |
        | Laura Pérez       | PQR678 Polo    |
        | Carlos Rodríguez  | STU901 Versa   |
        | Sofía Hernández   | VWX234 Clio    |
        | Daniel Díaz       | YZA567 2       |
        | Lucía Gómez       | BCD890 Rio     |
        +-------------------+----------------+
    ```
    **Explicaciòn:** Relaciono las entidades *cliente* y *vehiculo* y muestros datos de cada una de esas entidades para mostrar.

1. Obtener la cantidad de piezas en inventario para cada pieza
    ```sql
        SELECT RE.repuesto AS 'Repuesto', IV.cantidad AS 'Cantidad'
        FROM inventario AS IV
        INNER JOIN repuesto AS RE ON IV.repuesto_id = RE.id_repuesto;
    ```
    ```
        +--------------------+----------+
        | Repuesto           | Cantidad |
        +--------------------+----------+
        | Batería            |       10 |
        | Filtro de Aceite   |       20 |
        | Pastillas de Freno |       15 |
        | Llantas            |       25 |
        | Espejos Laterales  |       30 |
        +--------------------+----------+

    ```
    **Explicaciòn:** Relaciono las entidades *inventario* y *repuesto* y llamo datos de cada una de esas entidades para mostrar.

1. Obtener las citas programadas para un día específico
    ```sql
        SELECT *
        FROM cita as C
        WHERE DATE(C.date) = '2024-02-02';
    ```
    ```
        +---------+---------------------+------------+-------------+-------------+
        | id_cita | date                | cliente_id | servicio_id | vehiculo_id |
        +---------+---------------------+------------+-------------+-------------+
        |       2 | 2024-02-02 10:00:00 |          2 |           3 |           2 |
        +---------+---------------------+------------+-------------+-------------+
    ```
    **Explicaciòn:** Recorro la entidad *cita* y selecciono una fecha en espeficico, como el campo es DATETIME, lo formateo con *DATE()* para solo comparar la fecha.

1. Obtener una factura para un cliente específico en una fecha determinada
    ```sql
        SELECT *
        FROM factura AS F
        WHERE F.cliente_id = 4 AND F.fecha = '2020-06-04';
    ```
    ```
    +------------+------------+-----------+------------+
    | id_factura | fecha      | total     | cliente_id |
    +------------+------------+-----------+------------+
    |          4 | 2020-06-04 | 200000.00 |          4 |
    +------------+------------+-----------+------------+

    ```
    **Explicaciòn:** Recorro la entidad *factura* y selecciono una fecha en espeficico para el cliente con *id* = 4.

1. Listar todas las órdenes de compra y sus detalles
    ```sql
        SELECT OC.id_orden AS 'compraID', OD.empleado_id AS 'Empleado', OD.proveedor_id AS 'Proveedor', OD.repuesto_id AS 'Repuesto', OD.cantidad AS 'Cantidad', OD.precio AS 'valor'
        FROM orden_compra AS OC
        INNER JOIN orden_detalle AS OD ON OC.id_orden = OD.id_orden
        ORDER BY OD.precio;
    ```
    ```
        +----------+----------+-----------+----------+----------+-----------+
        | compraID | Empleado | Proveedor | Repuesto | Cantidad | valor     |
        +----------+----------+-----------+----------+----------+-----------+
        |        1 |        1 |         2 |        2 |        2 |  50000.00 |
        |        6 |        1 |         2 |        2 |        3 |  50000.00 |
        |        4 |        4 |         5 |        5 |        3 | 120000.00 |
        |        9 |        4 |         5 |        5 |        1 | 120000.00 |
        |        2 |        2 |         3 |        3 |        4 | 150000.00 |
        |        7 |        2 |         3 |        3 |        2 | 150000.00 |
        |        5 |        5 |         1 |        1 |        5 | 250000.00 |
        |       10 |        5 |         1 |        1 |        6 | 250000.00 |
        |        3 |        3 |         4 |        4 |        1 | 800000.00 |
        |        8 |        3 |         4 |        4 |        4 | 800000.00 |
        +----------+----------+-----------+----------+----------+-----------+
    ```
    **Explicaciòn:** Relaciono las entidades *orden_compra* y *orden_detalle* y extraigo los datos que necesito de cada tabla.

1. Obtener el costo total de piezas utilizadas en una reparación específica
    ```sql
        SELECT (SUM(RR.precio) * PR.cantidad) AS 'valor', PR.reparacion_id AS reparacionID
        FROM pieza_reparacion AS PR
        INNER JOIN repuesto AS RR ON PR.repuesto_id = RR.id_repuesto
        GROUP BY(PR.reparacion_id);

    ```
    ```

    ```
    **Explicaciòn:** Relaciono las entidades *orden_compra* y *orden_detalle* y extraigo los datos que necesito de cada tabla.