USE [SOLUM_EXPRESS]
GO
insert into "@EX_PROCESO" (Code,Name,Type,State) values ('SAP_SEND_KARDEX','ENVIO DE DATOS DE KARDEX',0,0)
insert into "@EX_MODELO" (Code,Name,SQL,Columnas,State) values ('M1_KARDEX','Modelo consulta de KARDEX para cliente ARTI','SBO_SOLUM_BC.DBO.SC_KardexMovimientos',0,0)
--delete "@EX_MODELO" where Code = 'M1_KARDEX'
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (155,'20100310288','SAP_SEND_KARDEX','M1_KARDEX',0,NULL,NULL,'C:\FTP Clientes\Arti\OUT\TRANSACCION\',0,'C:\FTP Clientes\Arti\OUT\TRANSACCION\HIS\',NULL,NULL,1,'Envio de Interfaz de Kardex ARTI',1,0,0,'C:\FTP Clientes\Arti\OUT\TRANSACCION\LOG\')
--insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
--values (155,'20100310288','SAP_SEND_KARDEX','M1_KARDEX',0,NULL,NULL,'D:\prueba\',0,'D:\prueba\his\',NULL,NULL,1,'Envio de Interfaz de Kardex ARTI',1,0,0,'D:\prueba\log\')
--delete from "@EX_RUTA" where Code = 155
--insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino) values(187,155,'Kardex_C20100310288_','TXT','|',NULL,0,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino) values(187,155,'Kardex_C20100310288_','XLSX',NULL,NULL,0,NULL)
--delete from "@EX_FILE" where Code = 187
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20100310288','SAP_SEND_KARDEX',1,6,30,1,1,1,1,1,1,1,1,0,1,NULL,NULL,0)
--delete from [@EX_PLANIFICADO]
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(365,155,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(366,155,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(367,155,'julio.suazo@arti.com.pe','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(368,155,'karen.yamunaque@arti.com.pe','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(369,155,'rene.pumacayo@arti.com.pe','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(370,155,'gcd.qwertysolutions@gmail.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(371,155,'alp.qwertysolutions@gmail.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(372,155,'adrian.guzman@boostersolutions.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(373,155,'maritza.flores@boostersolutions.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(374,155,'david.quinones@boostersolutions.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(375,155,'inventarios.lurin@boostersolutions.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(376,155,'julio.villavicencio@boostersolutions.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(377,155,'monica.gutierrez@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(378,155,'jorge.david@boostersolutions.com','',2,0)
--delete from "@EX_CONTACT" where U_EX_RUTA = 155
CREATE TABLE [dbo].[@EX_PLANIFICADO](
	[Code] [int] identity(1,1) NOT NULL,
	[U_EX_CLIENTE] [nvarchar](30) NOT NULL,
	[U_EX_PROCESO] [nvarchar](30) NOT NULL,
	[tipo] int NOT NULL, --0=Constante a demanda,1=Planificado
	[hora] int NULL, --Formato 24 horas
	[minuto] int NULL,
	[lunes] bit NULL,
	[martes] bit NULL,
	[miercoles] bit NULL,
	[jueves] bit NULL,
	[viernes] bit NULL,
	[sabado] bit NULL,
	[domingo] bit NULL,
	[modalidad] int NULL, --0=No genera archivo,1=Genera archivo a traves de un SP en el modelo
	[titulo] int NULL,--Numero de fila con los datos de cabecera (el conteo empieza en 0)
	[datos] int NULL,--Numero de fila donde arranca los datos (el conteo empieza en 0)
	[fechainicio] date NULL,
	[fechafin] date NULL,
	[ultimoproceso] datetime NULL,
	[mensaje] nvarchar(max) NULL,
	[hostgroupid] varchar(25) NULL,
	[usuario] nvarchar(50) NULL,
	[State] [bit] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name='BZ_JEPM_UltimoProceso_Planificado') 
BEGIN
	drop procedure BZ_JEPM_UltimoProceso_Planificado
END
go
create PROCEDURE [dbo].[BZ_JEPM_UltimoProceso_Planificado](@Code int,@Auditoria datetime,@Mensaje nvarchar(max) = NULL,@Hostgroupid varchar(25),@Usuario nvarchar(50))
AS
BEGIN
	UPDATE [@EX_PLANIFICADO] SET [ultimoproceso] = @Auditoria,mensaje = @Mensaje,hostgroupid = @Hostgroupid,usuario = @Usuario WHERE Code = @Code
END
Go
--drop TABLE [dbo].[@EX_PLANIFICADO]
SELECT * FROM "@EX_PROCESO"
SELECT * FROM "@EX_CLIENTE"
SELECT * FROM "@EX_MODELO" WHERE CODE = 'M1_KARDEX'
SELECT * FROM "@EX_RUTA" WHERE CODE = 155
SELECT * FROM "@EX_FILE" WHERE U_EX_RUTA = 155
SELECT * FROM "@EX_CONTACT" WHERE U_EX_RUTA = 155
SELECT * FROM "@EX_PLANIFICADO"

--EXEC SBO_SOLUM_BC.DBO.SC_KardexMovimientos 'C20100310288','2024-03-06','2024-03-06'
--EXEC SBO_SOLUM_BC.DBO.SC_KardexMovimientos_JOB 'C20100310288','2024-02-10','2024-02-10'
--select *  from [@EX_LOG] where HostGroupId = '20240213085451640'
UPDATE [@EX_PLANIFICADO] SET tipo = 1 WHERE CODE = 1
UPDATE [@EX_PLANIFICADO] SET modalidad = 1 WHERE CODE = 1
UPDATE [@EX_PLANIFICADO] SET hora = 8,minuto=0 WHERE CODE = 1
UPDATE [@EX_PLANIFICADO] SET fechainicio = '2024-03-06',fechafin='2024-03-06' WHERE CODE = 1
UPDATE [@EX_PLANIFICADO] SET fechainicio = null,fechafin=null WHERE CODE = 1
UPDATE [@EX_PLANIFICADO] SET ultimoproceso = NULL WHERE CODE = 1
UPDATE [@EX_PLANIFICADO] SET ultimoproceso = dateadd(day,-1,GETDATE()) WHERE CODE = 1

--select * from SBO_SOLUM_BC.DBO.oinm where cast(DocDate as date) = '2024-02-12'
SELECT * FROM "@EX_RUTA" WHERE U_EX_CLIENTE = '20100310288'
SELECT * FROM "@EX_FILE" WHERE U_EX_RUTA = 155
SELECT * FROM "@EX_CONTACT" WHERE U_EX_RUTA = 155
SELECT * FROM "@EX_LOG" WHERE U_EX_CLIENTE = '20100310288' AND U_EX_PROCESO = 'SAP_SEND_KARDEX'
--DELETE FROM "@EX_LOG" WHERE U_EX_CLIENTE = '20100310288' AND U_EX_PROCESO = 'SAP_SEND_KARDEX'


SELECT * FROM "@EX_LOG" WHERE HostGroupId = '20240213174419306'

