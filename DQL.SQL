	-- Se necesita: El diseño de la base de datos en un archivo de tipo imagen con buena resolución y los archivos SQL 
-- (Basados en PostgreSQL) con las querys de creaciones, inserciones y las siguientes consultas:


-- 1.  Listar Vehículos Disponibles: Obtener una lista de todos los vehículos disponibles para la venta, incluyendo detalles como marca, modelo, y precio.
	
	select marca, modelo, precio, estado, tipo, vendido from vehiculos where lower(tipo::text) = 'venta';
	
-- 2.  Clientes con Compras Recientes: Mostrar los clientes que han realizado compras recientemente, junto con la información de los vehículos adquiridos.

select
	clientes.nombre || ' ' || clientes.apellido as nombre, ventas.fecha, vehiculos.marca, vehiculos.modelo, vehiculos.precio, vehiculos.vendido 
from
	clientes
join ventas on
	ventas.id_cliente = clientes.id
join vehiculos on vehiculos.id = ventas.id_vehiculo 
where
	ventas.fecha >= current_date - interval '10 days';

-- 3.  Historial de Servicios por Vehículo: Obtener el historial completo de servicios realizados para un vehículo específico, incluyendo detalles sobre los empleados involucrados y las fechas de servicio.

select * from servicios ;
	-- a vehiculo id = 9
select servicios.id as id_servicio, concat(vehiculos.marca, ' ', vehiculos.modelo), servicios.fecha_inicio , servicios.fecha_finalizacion, array_agg(empleados.nombre) as empleados_Participantes from vehiculos join servicios ON servicios.id_vehiculo = vehiculos.id 
join empleadosxservicio ON empleadosxservicio.id_servicio = servicios.id 
join empleados on empleados.id = empleadosxservicio.id_empleado
where vehiculos.id = 9
group by servicios.id , vehiculos.id
;

-- 4.  Proveedores de Piezas Utilizados: Listar los proveedores de piezas que han suministrado componentes utilizados en los servicios de mantenimiento.

select proveedores.nombre, piezasxservicio.id_servicio, piezas.nombre  from proveedores left join piezasxproveedores ON piezasxproveedores.id_proveedor = proveedores.id 
left join piezas on piezas.id = piezasxproveedores.id_pieza 
left join piezasxservicio ON piezasxservicio.id_pieza = piezas.id 
where piezasxservicio.id_servicio is not null 
;

-- 5.  Rendimiento del Personal de Ventas: Calcular las comisiones generadas por cada empleado del departamento de ventas en un período específico.

	--	periodo enero
select empleados.nombre ,count(ventas) as cantidad_ventas, sum(vehiculos.precio) as totalVentas, case 
	when sum(vehiculos.precio) >= 7700 then sum(vehiculos.precio)*0.11
	else sum(vehiculos.precio)*0.1
end as comision
from ventas
join empleados on empleados.id = ventas.id_empleado 
join vehiculos on vehiculos.id = ventas.id_vehiculo 
where extract(month from ventas.fecha) = 1
group by empleados.id
;

-- 6.  Servicios Realizados por un Empleado: Identificar todos los servicios de mantenimiento realizados por un empleado específico, incluyendo detalles sobre los vehículos atendidos.

select
	empleados.nombre, vehiculos.marca || ' ' || vehiculos.modelo as nombre_carro, vehiculos.activo, servicios.fecha_inicio ,servicios.fecha_finalizacion 
from
	empleados
join empleadosxservicio on
	empleadosxservicio.id_empleado = empleados.id
join servicios on
	servicios.id = empleadosxservicio.id_servicio 
join vehiculos on vehiculos.id = servicios.id_vehiculo
where empleados.id = 7
;

-- 7.  Clientes Potenciales y Vehículos de Interés: Mostrar información sobre los clientes potenciales y los vehículos de su interés, proporcionando pistas valiosas para estrategias de marketing.

	-- clientes y vehiculos de interes
	select clientes.nombre, vehiculos.marca || ' ' || vehiculos.modelo as nombre_carro, interes.fecha as fecha_interes from clientes join interes ON interes.id_cliente = clientes.id  join vehiculos on vehiculos.id = interes.id_vehiculo ;

	-- rating de vehiculos por personas interesadas
	select vehiculos.marca || ' ' || vehiculos.modelo as nombre_carro, count(interes.id_vehiculo) as cantidad_personas_interesadas  from interes join vehiculos on vehiculos.id = interes.id_vehiculo 
	group by vehiculos.id 
	order by cantidad_personas_interesadas desc
	;


-- 8.  Empleados del Departamento de Servicio: Listar todos los empleados que pertenecen al departamento de servicio, junto con sus horarios de trabajo.

select nombre, hora_entrada, hora_salida,
case 
	when extract( hour from (hora_salida - hora_entrada) ) >= 0 then hora_salida - hora_entrada  
	else hora_entrada - hora_salida 
end as horas_jornada
from empleados where lower(rol::text) = 'servicio';


-- 9.  Vehículos Vendidos en un Rango de Precios: Encontrar los vehículos vendidos en un rango de precios específico, proporcionando datos útiles para análisis de ventas.
-- 10. Clientes con Múltiples Compras: Identificar a aquellos clientes que han realizado más de una compra en el concesionario, destacando la lealtad del cliente.