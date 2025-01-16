insert into proveedores values 
(default,'Repuestos esquinazo'),
(default,'llantas tiendita'),
(default,'superpiezas automoviles'),
(default,'centro de piezas automovilisticas'),
(default,'piezas la tienda')
;

insert into piezas values
(default,'tornillos',20),
(default,'tuercas',32),
(default,'frenos',18),
(default,'defensa',14),
(default,'placas',15),
(default,'puertas mod1',19),
(default,'ruedas XL',12),
(default,'ruedas XS',15),
(default,'balines mini',50),
(default,'puntillas extra largas',42),
(default,'cilindro XL',16),
(default,'cilindro XS',18)
;

insert into piezasxproveedores values
(1,1,16),
(1,2,12),
(1,3,22),
(2,4,16),
(2,5,6),
(3,6,8),
(4,7,14),
(4,8,13),
(5,9,9),
(5,10,17),
(1,11,19),
(5,12,17)
;

insert into empleados values 
(default,'Xaden','Riorson','venta','2025-11-19','01:50:26','01:50:26'+INTERVAL '8 HOURS'),
(default,'Violet','Sorrengail','venta','2025-11-05','14:53:18','14:53:18'+INTERVAL '8 HOURS'),
(default,'Kelsier','Mistborn','venta','2025-08-27','19:31:33','19:31:33'+INTERVAL '8 HOURS'),
(default,'Sazed','Murphy','servicio','2025-09-02','09:32:41','09:32:41'+INTERVAL '8 HOURS'),
(default,'Tensoon','Santiago','servicio','2025-04-11','15:16:46','15:16:46'+INTERVAL '8 HOURS'),
(default,'Elijah','Holmes','servicio','2025-03-24','04:04:08','04:04:08'+INTERVAL '8 HOURS'),
(default,'Addie','Bowman','servicio','2025-09-22','18:32:25','18:32:25'+INTERVAL '8 HOURS')
;

insert into clientes values 
(default,'Elend','Venture',28,true,true),
(default,'Howl','Castle',40,true,true),
(default,'Ruina','Book',30,true,true),
(default,'Marceline','Queen',37,true,false),
(default,'Theodore','Stanley',24,false,true),
(default,'Logan','Reynolds',23,false,true),
(default,'Lillian','Underwood',22,false,false)
;

insert into vehiculos values 
(default,'Nissan','Batman',2014,6569,'nuevo','venta',true),
(default,'Toyota','House',2004,7491,'usado','venta',true),
(default,'Mercedes','extreme-prj',2003,7739,'usado','venta',true),
(default,'Supra','fly-112',2018,6415,'nuevo','venta',false),
(default,'Toyota','Mist-aal',2004,6393,'usado','venta',false),
(default,'Mercedes','xlr8',2005,8426,'nuevo','venta',false)
;

insert into vehiculos values 
(default,'Nissan','ultimate',null,null,null,'servicio',null,true),
(default,'Toyota','drive4000',null,null,null,'servicio',null,true),
(default,'Nissan','nextGen',null,null,null,'servicio',null,true),
(default,'Supra','ChatBot',null,null,null,'servicio',null,false),
(default,'Supra','ModelX',null,null,null,'servicio',null,false),
(default,'Mercedes','MacroXS8',null,null,null,'servicio',null,false)
;

insert into interes values 
(1,4,'2025-02-08 13:23:44'),
(3,3,'2025-09-02 08:16:27'),
(1,2,'2025-10-14 22:50:52'),
(1,1,'2025-07-05 20:44:03'),
(2,7,'2025-03-04 18:39:44')
;



insert into servicios values 
(default,'2025-10-26 09:02:14','2025-10-26 09:02:14'::timestamp +interval '1 month',7,7),
(default,'2025-01-07 13:58:48','2025-01-07 13:58:48'::timestamp +interval '1 month',9,2),
(default,'2025-04-26 10:43:42','2025-04-26 10:43:42'::timestamp +interval '1 month',12,6),
(default,'2025-11-01 11:52:12','2025-11-01 11:52:12'::timestamp +interval '1 month',11,7),
(default,'2025-09-27 13:22:11','2025-09-27 13:22:11'::timestamp +interval '1 month',9,1),
(default,'2025-01-31 08:10:12','2025-01-31 08:10:12'::timestamp +interval '1 month',7,3),
(default,'2025-10-11 07:11:42','2025-10-11 07:11:42'::timestamp +interval '1 month',9,7)
;

insert into piezasXservicio values 
(2,4),
(1,5),
(6,8),
(2,1),
(1,2),
(2,10),
(6,4),
(7,1),
(6,11)
;

insert into empleadosXservicio values
(5,1,'2025-11-30 15:21:36'),
(7,1,'2025-11-18 07:48:43'),
(5,3,'2025-12-28 14:46:21'),
(5,2,'2025-08-16 11:28:57'),
(7,5,'2025-10-13 19:55:38'),
(4,6,'2025-11-21 20:18:26'),
(7,4,'2025-05-31 17:03:56'),
(7,7,'2025-06-14 00:18:46'),
(4,5,'2025-05-15 01:08:51')
;

delete from ventas;

insert into ventas values 
(3,1,4,'2024-11-09 13:42:41'),
(1,2,2,'2025-01-15 13:25:51'),
(3,3,1,'2025-01-12 13:42:41')
;
