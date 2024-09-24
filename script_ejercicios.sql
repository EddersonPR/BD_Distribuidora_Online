
USE BD_DO
--- EJERCICIOS BÁSICOS --
-- 1. Listar todas las ciudades: Consulta para obtener todas las ciudades registradas en la tabla TB_CIUDADES. 
	SELECT CIUDAD FROM TB_CIUDADES

-- 2. Contar la cantidad de tipos de líneas: Consulta cuántos tipos de líneas hay en la tabla TB_TIPO_LINEAS.
	SELECT COUNT(*) TOTAL_TIPOS_LINEA FROM TB_TIPO_LINEAS

-- 3. Listar todos los vendedores: Muestra todos los registros de la tabla TB_VENDEDORES, incluyendo el nombre y apellido.
	SELECT NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO FROM TB_VENDEDORES

-- 4. Consultar ventas por ciudad: Realiza una consulta que muestre la cantidad total de ventas agrupadas por ciudad.
	
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

	SELECT
	CONCAT(NOMBRES,' ',APELLIDO_PATERNO,' ',APELLIDO_MATERNO) CLIENTE,
	TC.CIUDAD
	FROM TB_CLIENTES TCC
	JOIN TB_CIUDADES TC ON TCC.ID_CIUDAD = TC.ID

-- EJERCICIOS AVANZADOS ---
-- 1. Ventas por tipo de linea: Realiza una consulta que muestre la cantidad de ventas agrupadas por tipo de linea (prepago y postpago).
	SELECT 
    TB_TIPO_LINEAS.TIPO_LINEA,
    COUNT(*) TOTAL_VENTAS
	FROM 
    TB_VENTAS
	JOIN 
    TB_PLANES ON TB_VENTAS.ID_PLAN = TB_PLANES.ID
	JOIN 
	TB_TIPO_LINEAS ON TB_PLANES.ID_TIPO_LINEA = TB_TIPO_LINEAS.ID
	GROUP BY 
    TB_TIPO_LINEAS.TIPO_LINEA

-- 2. Vendedores con más ventas: Crea una consulta que muestre el nombre y apellido de los vendedores junto con la cantidad de ventas que 
-- han realizado, ordenados de mayor a menor.
	
    SELECT
    CONCAT(TB_VENDEDORES.NOMBRES, ' ', TB_VENDEDORES.APELLIDO_PATERNO, ' ', TB_VENDEDORES.APELLIDO_MATERNO) AS VENDEDOR,
    COUNT(TB_VENTAS.ID) AS TOTAL_VENTAS
    FROM TB_VENDEDORES
    JOIN TB_VENTAS ON TB_VENDEDORES.ID = TB_VENTAS.ID_VENDEDOR
    GROUP BY TB_VENDEDORES.NOMBRES, TB_VENDEDORES.APELLIDO_PATERNO, TB_VENDEDORES.APELLIDO_MATERNO
    ORDER BY TOTAL_VENTAS DESC;


-- 3. Clientes sin ventas: Muestra todos los clientes que no han realizado ninguna venta.

	SELECT
	TB_CLIENTES.ID,
	TB_CLIENTES.NOMBRES
	FROM TB_CLIENTES
	LEFT JOIN TB_VENTAS ON TB_CLIENTES.ID = TB_VENTAS.ID_CLIENTE
	WHERE TB_VENTAS.ID_CLIENTE IS NULL;

-- 4. Análisis de ventas por mes: Genera una consulta que muestre la cantidad total de ventas por mes y año.
	
	SELECT
    YEAR(FECHA_ACTIVACION) AS AÑO,
    MONTH(FECHA_ACTIVACION) AS NRO_MES,
    DATENAME(MONTH, FECHA_ACTIVACION) AS MES,
    COUNT(*) AS TOTAL_VENTAS
	FROM TB_VENTAS
	GROUP BY YEAR(FECHA_ACTIVACION), MONTH(FECHA_ACTIVACION), DATENAME(MONTH, FECHA_ACTIVACION)
	ORDER BY AÑO, NRO_MES


-- 5. Impacto de redes sociales en ventas: Muestra un análisis del total de ventas y el monto promedio por red social.

	SELECT
    RS.RED_SOCIAL,
    COUNT(*) AS TOTAL_VENTAS,
    ROUND(AVG(P.PRECIO), 2) AS MONTO_PROMEDIO
	FROM TB_VENTAS V
	JOIN TB_REDES_SOCIALES RS ON V.ID_RED_SOCIAL = RS.ID
	JOIN TB_PLANES P ON V.ID_PLAN = P.ID
	GROUP BY RS.RED_SOCIAL;
