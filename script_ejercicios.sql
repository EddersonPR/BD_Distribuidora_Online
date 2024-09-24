
--- EJERCICIOS BÁSICOS --
-- 1. Listar todas las ciudades: Consulta para obtener todas las ciudades registradas en la tabla TB_CIUDADES. 

	SELECT CIUDAD FROM TB_CIUDADES

-- 2. Contar la cantidad de tipos de líneas: Consulta cuántos tipos de líneas hay en la tabla TB_TIPO_LINEAS.
	
	SELECT COUNT(*) TOTAL_TIPOS_LINEA FROM TB_TIPO_LINEAS

-- 3. Listar todos los vendedores: Muestra todos los registros de la tabla TB_VENDEDORES, incluyendo el nombre y apellido.
	
	SELECT NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO FROM TB_VENDEDORES

-- 4. Consultar ventas por ciudad: Realiza una consulta que muestre la cantidad total de ventas agrupadas por ciudad.
	
	SELECT * FROM TB_CLIENTES
	SELECT * FROM TB_CIUDADES

	SELECT 
    TB_CIUDADES.CIUDAD,
    COUNT(*) TOTAL_VENTAS
	FROM 
    TB_VENTAS
	JOIN 
    TB_CLIENTES ON TB_VENTAS.ID_CLIENTE = TB_CLIENTES.ID
	JOIN 
    TB_CIUDADES ON TB_CLIENTES.ID_CIUDAD = TB_CIUDADES.ID
	GROUP BY 
    TB_CIUDADES.CIUDAD;



-- 5. Obtener planes disponibles: Muestra todos los planes disponibles en la tabla TB_PLANES, incluyendo el nombre del plan y su precio.
	
	SELECT
	NOMBRE_PLAN,
	PRECIO
	FROM TB_PLANES


-- EJERCICIOS INTERMEDIOS ---
-- 1. Listar vendedores y sus supervisores: Crea una consulta que muestre el nombre y apellido de los vendedores junto con el nombre 
-- de su supervisor.

	SELECT * FROM TB_VENDEDORES
	SELECT * FROM TB_SUPERVISORES

	SELECT
	CONCAT(TV.NOMBRES,' ',TV.APELLIDO_PATERNO,' ',TV.APELLIDO_MATERNO) NOMBRES_VENDEDOR,
	TS.NOMBRES
	FROM TB_VENDEDORES TV
	JOIN TB_SUPERVISORES TS ON TV.ID_SUPERVISOR = TS.ID


-- 2. Consultar ventas activas: Realiza una consulta para obtener la cantidad de ventas donde el estado de la línea es "Activa".
	
	SELECT
	COUNT(*) VENTAS_ACTIVAS
	FROM TB_VENTAS
	WHERE ESTADO_LINEA = 'Activo'

-- 3. Ventas por red social: Crea una consulta que muestre la cantidad de ventas realizadas a través de cada red social.
	
	SELECT 
    TB_REDES_SOCIALES.RED_SOCIAL,
    COUNT(*) TOTAL_VENTAS
	FROM 
    TB_VENTAS
	JOIN 
    TB_REDES_SOCIALES ON TB_VENTAS.ID_RED_SOCIAL = TB_REDES_SOCIALES.ID
	GROUP BY 
    TB_REDES_SOCIALES.RED_SOCIAL;

-- 4. Promedio de precios de planes: Calcula el precio promedio de los planes en la tabla TB_PLANES.

	SELECT
	ROUND(AVG(PRECIO),2) PRECIO_PROMEDIO
	FROM TB_PLANES

-- 5. Clientes y sus ciudades: Muestra la lista de clientes con sus respectivas ciudades.

-- EJERCICIOS AVANZADOS ---
-- 1. Ventas por tipo de conexión: Realiza una consulta que muestre la cantidad de ventas agrupadas por tipo de conexión (prepago y postpago).

-- 2. Vendedores con más ventas: Crea una consulta que muestre el nombre y apellido de los vendedores junto con la cantidad de ventas que han realizado, ordenados de mayor a menor.

-- 3. Clientes sin ventas: Muestra todos los clientes que no han realizado ninguna venta.

-- 4. Análisis de ventas por mes: Genera una consulta que muestre la cantidad total de ventas por mes y año.

-- 5. Impacto de redes sociales en ventas: Muestra un análisis del total de ventas y el monto promedio por red social.