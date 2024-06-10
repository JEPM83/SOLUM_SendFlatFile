USE [SOLUM_EXPRESS]
GO
insert into "@EX_PROCESO" (Code,Name,Type,State) values ('SAP_UPDATE_DESPACHO','ENVIO PARA ACTUALIZAR DATOS DE TRACKING DE DESPACHO MULTICLIENTE',0,0)
insert into "@EX_PROCESO" (Code,Name,Type,State) values ('SAP_UPDATE_LIQUIDACION','ENVIO PARA ACTUALIZAR DATOS DE TRACKING DE LIQUIDACION MULTICLIENTE',0,0)
--delete from "@EX_PROCESO" where Code = 'SAP_UPDATE_DESPACHO'
--delete from "@EX_PROCESO" where Code = 'SAP_UPDATE_LIQUIDACION'
--insert into "@EX_MODELO" (Code,Name,SQL,Columnas,State) values ('M1_KARDEX','Modelo consulta de KARDEX para cliente ARTI','SBO_SOLUM_BC.DBO.SC_KardexMovimientos',0,0)
--delete "@EX_MODELO" where Code = 'M1_KARDEX'
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (160,'20100310288','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (161,'20167884491','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (162,'20605977406','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (163,'20609268779','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (164,'20608718657','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (165,'20608323725','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (166,'20605419004','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (167,'20604009741','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (168,'20566160987','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (169,'20557203550','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (170,'20555712791','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (171,'20551288120','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (172,'20547904223','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (173,'20537821249','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (174,'20519478511','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (175,'20513309351','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (176,'20509675491','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (177,'20504498744','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (178,'20458805165','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (179,'20381600441','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')
insert into "@EX_RUTA" (Code,U_EX_CLIENTE,U_EX_PROCESO,U_EX_MODELO,Environment,Server,Port,Route,Sftp,Historic,UserSap,Password,Email,Subject,Attached,Zip,State,LogErr)
values (180,'20378890161','SAP_UPDATE_DESPACHO',NULL,0,NULL,NULL,'C:\FTP Clientes\GENERAL\IN\DESPACHO\',0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\HIS\',NULL,NULL,1,'Envio de Interfaz de despacho a SAP',0,0,0,'C:\FTP Clientes\GENERAL\IN\DESPACHO\LOG\')


--delete from "@EX_RUTA" where Code >= 160
--select * from "@EX_RUTA" where Code = 162
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(194,160,'TRACKING_DESPACHO_20100310288_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(195,160,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(196,161,'TRACKING_DESPACHO_20167884491_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(197,161,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(198,162,'TRACKING_DESPACHO_20605977406_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(199,162,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(200,163,'TRACKING_DESPACHO_20609268779_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(201,163,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(202,164,'TRACKING_DESPACHO_20608718657_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(203,164,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(204,165,'TRACKING_DESPACHO_20608323725_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(205,165,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(206,166,'TRACKING_DESPACHO_20605419004_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(207,166,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(208,167,'TRACKING_DESPACHO_20604009741_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(209,167,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(210,168,'TRACKING_DESPACHO_20566160987_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(211,168,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(212,169,'TRACKING_DESPACHO_20557203550_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(213,169,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(214,170,'TRACKING_DESPACHO_20555712791_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(215,170,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(216,171,'TRACKING_DESPACHO_20551288120_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(217,171,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(218,172,'TRACKING_DESPACHO_20547904223_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(219,172,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(220,173,'TRACKING_DESPACHO_20537821249_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(221,173,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(222,174,'TRACKING_DESPACHO_20519478511_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(223,174,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(224,175,'TRACKING_DESPACHO_20513309351_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(225,175,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(226,176,'TRACKING_DESPACHO_20509675491_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(227,176,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(228,177,'TRACKING_DESPACHO_20504498744_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(229,177,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(230,178,'TRACKING_DESPACHO_20458805165_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(231,178,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(232,179,'TRACKING_DESPACHO_20381600441_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(233,179,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(234,180,'TRACKING_DESPACHO_20378890161_','TXT','\t',NULL,0,'SAP_HOST_DESPACHO',NULL,NULL)
insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(235,180,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',4,'exec BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR @@SOCIEDAD , @@HGUI ')
--delete from "@EX_FILE" where U_EX_RUTA >=160
--select * from "@EX_FILE" where U_EX_RUTA = 160
--select * from "@EX_FILE" where U_EX_RUTA = 161
--alter table "@EX_FILE" add Type int null
--alter table "@EX_FILE" add SAttribute varchar(max) null
--delete from [@EX_PLANIFICADO] where U_EX_PROCESO in ('SAP_UPDATE_DESPACHO','SAP_UPDATE_LIQUIDACION')
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20100310288','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20167884491','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20605977406','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20609268779','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20608718657','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20608323725','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20605419004','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20604009741','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20566160987','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20557203550','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20555712791','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20551288120','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20547904223','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20537821249','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20519478511','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20513309351','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20509675491','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20504498744','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20458805165','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20381600441','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
insert into [@EX_PLANIFICADO] (U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,fechainicio,fechafin,State) 
values('20378890161','SAP_UPDATE_DESPACHO',0,NULL,NULL,1,1,1,1,1,1,1,2,1,3,NULL,NULL,0)
--delete from [@EX_PLANIFICADO] where U_EX_PROCESO = 'SAP_UPDATE_DESPACHO'
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(388,160,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(389,160,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(390,160,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(391,161,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(392,161,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(393,161,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(394,162,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(395,162,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(396,162,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(397,163,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(398,163,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(399,163,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(400,164,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(401,164,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(402,164,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(403,165,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(404,165,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(405,165,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(406,166,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(407,166,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(408,166,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(409,167,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(410,167,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(411,167,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(412,168,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(413,168,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(414,168,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(415,169,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(416,169,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(417,169,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(418,170,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(419,170,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(420,170,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(421,171,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(422,171,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(423,171,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(424,172,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(425,172,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(426,172,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(427,173,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(428,173,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(429,173,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(430,174,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(431,174,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(432,174,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(433,175,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(434,175,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(435,175,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(436,176,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(437,176,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(438,176,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(439,177,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(440,177,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(441,177,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(442,178,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(443,178,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(444,178,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(445,179,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(446,179,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(447,179,'angel.uribe@boostersolutions.com ','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(448,180,'operador.3pl@solum-logistics.com','$olum$2021',0,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(449,180,'epariona.sistemas@gmail.com','',2,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(450,180,'angel.uribe@boostersolutions.com ','',1,0)

insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(514,160,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(515,160,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(516,160,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(517,160,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(518,161,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(519,161,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(520,161,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(521,161,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(522,162,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(523,162,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(524,162,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(525,162,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(526,163,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(527,163,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(528,163,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(529,163,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(530,164,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(531,164,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(532,164,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(533,164,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(534,165,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(535,165,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(536,165,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(537,165,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(538,166,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(539,166,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(540,166,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(541,166,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(542,167,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(543,167,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(544,167,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(545,167,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(546,168,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(547,168,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(548,168,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(549,168,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(550,169,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(551,169,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(552,169,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(553,169,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(554,170,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(555,170,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(556,170,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(557,170,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(558,171,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(559,171,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(560,171,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(561,171,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(562,172,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(563,172,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(564,172,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(565,172,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(566,173,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(567,173,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(568,173,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(569,173,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(570,174,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(571,174,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(572,174,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(573,174,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(574,175,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(575,175,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(576,175,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(577,175,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(578,176,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(579,176,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(580,176,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(581,176,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(582,177,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(583,177,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(584,177,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(585,177,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(586,178,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(587,178,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(588,178,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(589,178,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(590,179,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(591,179,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(592,179,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(593,179,'ecommerce.lurin@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(594,180,'miguel.garcia@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(595,180,'frank.prado@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(596,180,'programacion.despacho@boostersolutions.com','',1,0)
insert into "@EX_CONTACT" (Code,U_EX_RUTA,Email,Password,Type,State) values(597,180,'ecommerce.lurin@boostersolutions.com','',1,0)
--select * from [dbo].[@EX_LOG] where U_EX_RUTA >= 160
--select count(*) from [dbo].[@EX_LOG] where U_EX_RUTA = 160
--delete from [dbo].[@EX_LOG] where U_EX_PROCESO IN ('SAP_UPDATE_DESPACHO','SAP_UPDATE_LIQUIDACION')
--delete from "@EX_CONTACT" where U_EX_RUTA >= 160
--select * from "@EX_CONTACT" where U_EX_RUTA = 160
--select * from SAP_HOST_DESPACHO
--select * from SAP_HOST_LIQUIDACION
--truncate table SAP_HOST_DESPACHO
--truncate table SAP_HOST_LIQUIDACION
--drop table SAP_HOST_LIQUIDACION
create table SAP_HOST_DESPACHO(
	Code int identity(1,1) not null,
	Sociedad nvarchar(100) not null,
	HostGroupId varchar(25) not null,
	U_EX_CLIENTE nvarchar(30) not null,
	DocEntry nvarchar(300) null,
	Series nvarchar(300) null,
	DocEntrySAP nvarchar(300) null,
	U_BZ_CARGA nvarchar(300) null,
	U_BZ_TIPOVEH nvarchar(300) null,
	U_BZ_SECPEDIDO nvarchar(300) null,
	U_SYP_LUGAR_CARGA nvarchar(300) null,
	U_BZ_NAVE nvarchar(300) null,
	U_SYP_Ruta nvarchar(300) null,
	U_BZ_PLACA nvarchar(300) null,
	U_SL_RUCTRANSPORTISTA nvarchar(300) null,
	U_BZ_TRANSPORTISTA nvarchar(300) null,
	U_BPP_MDFN nvarchar(300) null,
	U_BC_ApeCond nvarchar(300) null,
	U_BC_NroDocConduc nvarchar(300) null,
	U_BPP_MDFC nvarchar(300) null,
	U_BC_TipoDocCond nvarchar(300) null,
	U_BC_TipoDocTransp nvarchar(300) null,
	U_tipoTransporte nvarchar(300) null,
	U_BZ_RESGUARDO nvarchar(300) null,
	U_BC_CHEKPACKING nvarchar(300) null,
	U_BZ_HICITA nvarchar(300) null,
	U_BZ_HFCITA nvarchar(300) null,
	U_TIPO_DESPA nvarchar(300) null,
	U_BZ_FCHEMB nvarchar(300) null,
	U_BZ_FFINAL nvarchar(300) null,
	U_SC_HORAS_ADIC nvarchar(300) null
)
create table SAP_HOST_LIQUIDACION(
	Code int identity(1,1) not null,
	Sociedad nvarchar(100) not null,
	HostGroupId varchar(25) not null,
	U_EX_CLIENTE nvarchar(30) not null,
	DocEntry nvarchar(300) null,
	Series nvarchar(300) null,
	U_BZ_FCHEMB nvarchar(300) null,
	U_BZ_FFINAL nvarchar(300) null,
	U_SC_HORAS_ADIC nvarchar(300) null,
	U_BZ_TCKFEEN nvarchar(300) null,
	U_BZ_TCKHOEN nvarchar(300) null,
	U_BZ_TCKFELQ nvarchar(300) null,
	U_BZ_TCKHOLQ nvarchar(300) null,
	U_SL_FECHENVOF nvarchar(300) null,
	U_BZ_ISC nvarchar(300) null,
	--
	DocEntrySAP nvarchar(300) null,
	U_BZ_CARGA nvarchar(300) null,
	U_BZ_TIPOVEH nvarchar(300) null,
	U_BZ_SECPEDIDO nvarchar(300) null,
	U_SYP_LUGAR_CARGA nvarchar(300) null,
	U_BZ_NAVE nvarchar(300) null,
	U_SYP_Ruta nvarchar(300) null,
	U_BZ_PLACA nvarchar(300) null,
	U_SL_RUCTRANSPORTISTA nvarchar(300) null,
	U_BZ_TRANSPORTISTA nvarchar(300) null,
	U_BPP_MDFN nvarchar(300) null,
	U_BC_ApeCond nvarchar(300) null,
	U_BC_NroDocConduc nvarchar(300) null,
	U_BPP_MDFC nvarchar(300) null,
	U_BC_TipoDocCond nvarchar(300) null,
	U_BC_TipoDocTransp nvarchar(300) null,
	U_tipoTransporte nvarchar(300) null,
	U_BZ_RESGUARDO nvarchar(300) null,
	U_BC_CHEKPACKING nvarchar(300) null,
	U_BZ_HICITA nvarchar(300) null,
	U_BZ_HFCITA nvarchar(300) null,
	U_TIPO_DESPA nvarchar(300) null
	--U_BZ_FCHEMB nvarchar(300) null,
	--U_BZ_FFINAL nvarchar(300) null,
	--U_SC_HORAS_ADIC nvarchar(300) null
)
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
	[modalidad] int NULL, --0=No genera archivo solo envia correo a partir de un archivo,1=Genera archivo a traves de un SP en el modelo,2=No genera archivo, migra a una tabla desde un archivo
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
declare @tipo varchar(10)
declare @titulo varchar(100)
declare @mensaje_1 varchar(max)
begin try
	begin transaction
	UPDATE [@EX_PLANIFICADO] SET [ultimoproceso] = @Auditoria,mensaje = @Mensaje,hostgroupid = @Hostgroupid,usuario = @Usuario WHERE Code = @Code
	commit transaction
	end try
begin catch
	if @@TRANCOUNT > 0
	begin
		set @tipo = 'error'
		set @titulo = 'ERROR!!'
		set @mensaje_1 = 'REGISTO INCORRECTO. ' + ERROR_MESSAGE() + ' OBJETO. ' + ERROR_PROCEDURE() + '. Error line: ' + cast(ERROR_LINE() AS NVARCHAR(6))
		rollback transaction POST_Update_ORDR_Despacho
	end
end catch
select @tipo tipo,@titulo titulo,@mensaje_1 mensaje
END
Go

IF EXISTS (SELECT * FROM sysobjects WHERE name='BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR') 
BEGIN
	drop procedure BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR
END
go
create PROCEDURE [dbo].[BZ_JEPM_ACTUALIZAR_DESPACHO_ORDR](@Sociedad varchar(100),@Hostgroupid varchar(25))
AS
begin
declare @tipo varchar(10)
declare @titulo varchar(100)
declare @mensaje varchar(max)
begin try
	begin transaction POST_Update_ORDR_Despacho
	if @Sociedad = 'SBO_SOLUM_BC'
	begin
		update SBO_SOLUM_BC.dbo.ORDR set 
		U_BZ_CARGA = case when isnull(trim(t1.U_BZ_CARGA),'')<>'' then trim(t1.U_BZ_CARGA) end,
		U_BZ_TIPOVEH = case when isnull(trim(t1.U_BZ_TIPOVEH),'')<>'' then trim(t1.U_BZ_TIPOVEH) end,
		U_BZ_SECPEDIDO = case when isnull(trim(t1.U_BZ_SECPEDIDO),'')<>'' then trim(t1.U_BZ_SECPEDIDO) end,
		U_SYP_LUGAR_CARGA = case when isnull(trim(t1.U_SYP_LUGAR_CARGA),'')<>'' then trim(t1.U_SYP_LUGAR_CARGA) end,
		U_BZ_NAVE = case when isnull(trim(t1.U_BZ_NAVE),'')<>'' then trim(t1.U_BZ_NAVE) end,
		U_SYP_Ruta = case when isnull(trim(t1.U_SYP_Ruta),'')<>'' then trim(t1.U_SYP_Ruta) end,
		U_BZ_PLACA = case when isnull(trim(t1.U_BZ_PLACA),'')<>'' then trim(t1.U_BZ_PLACA) end,
		U_SL_RUCTRANSPORTISTA = case when isnull(trim(t1.U_SL_RUCTRANSPORTISTA),'')<>'' then trim(t1.U_SL_RUCTRANSPORTISTA) end,
		U_BZ_TRANSPORTISTA = case when isnull(trim(t1.U_BZ_TRANSPORTISTA),'')<>'' then trim(t1.U_BZ_TRANSPORTISTA) end,
		U_BPP_MDFN = case when isnull(trim(t1.U_BPP_MDFN),'')<>'' then trim(t1.U_BPP_MDFN) end,
		U_BC_ApeCond = case when isnull(trim(t1.U_BC_ApeCond),'')<>'' then trim(t1.U_BC_ApeCond) end,
		U_BC_NroDocConduc = case when isnull(trim(t1.U_BC_NroDocConduc),'')<>'' then trim(t1.U_BC_NroDocConduc) end,
		U_BPP_MDFC = case when isnull(trim(t1.U_BPP_MDFC),'')<>'' then trim(t1.U_BPP_MDFC) end,
		U_BC_TipoDocCond = case when isnull(trim(t1.U_BC_TipoDocCond),'')<>'' then trim(t1.U_BC_TipoDocCond) end,
		U_BC_TipoDocTransp = case when isnull(trim(t1.U_BC_TipoDocTransp),'')<>'' then trim(t1.U_BC_TipoDocTransp) end,
		U_tipoTransporte = case when isnull(trim(t1.U_tipoTransporte),'')<>'' then trim(t1.U_tipoTransporte) end,
		U_BZ_RESGUARDO = case when isnull(trim(t1.U_BZ_RESGUARDO),'')<>'' then trim(t1.U_BZ_RESGUARDO) end,
		U_BC_CHEKPACKING = case when isnull(trim(t1.U_BC_CHEKPACKING),'')<>'' then trim(t1.U_BC_CHEKPACKING) end,
		U_BZ_HICITA = case when isnull(trim(t1.U_BZ_HICITA),'')<>'' then trim(t1.U_BZ_HICITA) end,
		U_BZ_HFCITA = case when isnull(trim(t1.U_BZ_HFCITA),'')<>'' then trim(t1.U_BZ_HFCITA) end,
		U_TIPO_DESPA = case when isnull(trim(t1.U_TIPO_DESPA),'')<>'' then trim(t1.U_TIPO_DESPA) end,
		U_BZ_FCHEMB = case when isnull(trim(t1.U_BZ_FCHEMB),'')<>'' then trim(t1.U_BZ_FCHEMB) end,
		U_BZ_FFINAL = case when isnull(trim(t1.U_BZ_FFINAL),'')<>'' then trim(t1.U_BZ_FFINAL) end,
		U_SC_HORAS_ADIC = case when isnull(trim(t1.U_SC_HORAS_ADIC),'')<>'' then trim(t1.U_SC_HORAS_ADIC) end
		from SBO_SOLUM_BC.dbo.ORDR t0 inner join SOLUM_EXPRESS.dbo.SAP_HOST_DESPACHO t1 on t0.DocNum = t1.DocEntry and t0.Series = t1.Series
		where t1.Sociedad = @Sociedad and t1.HostGroupid = @Hostgroupid
	end
	else if @Sociedad = 'SBO_DERMO_BC'
	begin
		update SBO_DERMO_BC.dbo.ORDR set 
		U_BZ_CARGA = case when isnull(trim(t1.U_BZ_CARGA),'')<>'' then trim(t1.U_BZ_CARGA) end,
		U_BZ_TIPOVEH = case when isnull(trim(t1.U_BZ_TIPOVEH),'')<>'' then trim(t1.U_BZ_TIPOVEH) end,
		U_BZ_SECPEDIDO = case when isnull(trim(t1.U_BZ_SECPEDIDO),'')<>'' then trim(t1.U_BZ_SECPEDIDO) end,
		U_SYP_LUGAR_CARGA = case when isnull(trim(t1.U_SYP_LUGAR_CARGA),'')<>'' then trim(t1.U_SYP_LUGAR_CARGA) end,
		U_BZ_NAVE = case when isnull(trim(t1.U_BZ_NAVE),'')<>'' then trim(t1.U_BZ_NAVE) end,
		U_SYP_Ruta = case when isnull(trim(t1.U_SYP_Ruta),'')<>'' then trim(t1.U_SYP_Ruta) end,
		U_BZ_PLACA = case when isnull(trim(t1.U_BZ_PLACA),'')<>'' then trim(t1.U_BZ_PLACA) end,
		--U_SL_RUCTRANSPORTISTA = case when isnull(trim(t1.U_SL_RUCTRANSPORTISTA),'')<>'' then t1.U_SL_RUCTRANSPORTISTA end,
		U_BZ_TRANSPORTISTA = case when isnull(trim(t1.U_BZ_TRANSPORTISTA),'')<>'' then trim(t1.U_BZ_TRANSPORTISTA) end,
		U_BPP_MDFN = case when isnull(trim(t1.U_BPP_MDFN),'')<>'' then trim(t1.U_BPP_MDFN) end,
		--U_BC_ApeCond = case when isnull(trim(t1.U_BC_ApeCond),'')<>'' then t1.U_BC_ApeCond end,
		--U_BC_NroDocConduc = case when isnull(trim(t1.U_BC_NroDocConduc),'')<>'' then t1.U_BC_NroDocConduc end,
		U_BPP_MDFC = case when isnull(trim(t1.U_BPP_MDFC),'')<>'' then trim(t1.U_BPP_MDFC) end,
		--U_BC_TipoDocCond = case when isnull(trim(t1.U_BC_TipoDocCond),'')<>'' then t1.U_BC_TipoDocCond end,
		--U_BC_TipoDocTransp = case when isnull(trim(t1.U_BC_TipoDocTransp),'')<>'' then t1.U_BC_TipoDocTransp end,
		--U_tipoTransporte = case when isnull(trim(t1.U_tipoTransporte),'')<>'' then t1.U_tipoTransporte end,
		--U_BZ_RESGUARDO = case when isnull(trim(t1.U_BZ_RESGUARDO),'')<>'' then t1.U_BZ_RESGUARDO end,
		U_BC_CHEKPACKING = case when isnull(trim(t1.U_BC_CHEKPACKING),'')<>'' then trim(t1.U_BC_CHEKPACKING) end,
		U_BZ_HICITA = case when isnull(trim(t1.U_BZ_HICITA),'')<>'' then trim(t1.U_BZ_HICITA) end,
		U_BZ_HFCITA = case when isnull(trim(t1.U_BZ_HFCITA),'')<>'' then trim(t1.U_BZ_HFCITA) end,
		U_TIPO_DESPA = case when isnull(trim(t1.U_TIPO_DESPA),'')<>'' then trim(t1.U_TIPO_DESPA) end,
		U_BZ_FCHEMB = case when isnull(trim(t1.U_BZ_FCHEMB),'')<>'' then trim(t1.U_BZ_FCHEMB) end,
		U_BZ_FFINAL = case when isnull(trim(t1.U_BZ_FFINAL),'')<>'' then trim(t1.U_BZ_FFINAL) end,
		U_SC_HORAS_ADIC = case when isnull(trim(t1.U_SC_HORAS_ADIC),'')<>'' then trim(t1.U_SC_HORAS_ADIC) end
		from SBO_DERMO_BC.dbo.ORDR t0 inner join SOLUM_EXPRESS.dbo.SAP_HOST_DESPACHO t1 on t0.DocNum = t1.DocEntry and t0.Series = t1.Series
		where t1.Sociedad = @Sociedad and t1.HostGroupid = @Hostgroupid
	end
	--insert into "@EX_FILE" (Code,U_EX_RUTA,Prefix,Extent,Separator,[Order],State,Destino,Type,SAttribute) values(999,160,'SAP_HOST_DESPACHO',NULL,NULL,NULL,0,'SAP_HOST_DESPACHO',NULL,'exec EP_INSERTAR_CEVA_DELIVERY @@HGUI ')
	set @tipo = 'success'
	set @titulo = 'CORRECTO!!'
	set @mensaje = 'REGISTRO CORRECTO.'
	commit transaction POST_Update_ORDR_Despacho
end try
begin catch
	if @@TRANCOUNT > 0
	begin
		set @tipo = 'error'
		set @titulo = 'ERROR!!'
		set @mensaje = 'REGISTO INCORRECTO. ' + ERROR_MESSAGE() + ' OBJETO. ' + ERROR_PROCEDURE() + '. Error line: ' + cast(ERROR_LINE() AS NVARCHAR(6))
		rollback transaction POST_Update_ORDR_Despacho
	end
end catch
select @tipo tipo,@titulo titulo,@mensaje mensaje
end
go

IF EXISTS (SELECT * FROM sysobjects WHERE name='BZ_JEPM_ACTUALIZAR_LIQUIDACION_ODLN') 
BEGIN
	drop procedure BZ_JEPM_ACTUALIZAR_LIQUIDACION_ODLN
END
go
create PROCEDURE [dbo].[BZ_JEPM_ACTUALIZAR_LIQUIDACION_ODLN](@Sociedad varchar(100),@Hostgroupid varchar(25))
AS
begin
declare @tipo varchar(10)
declare @titulo varchar(100)
declare @mensaje varchar(max)
begin try
	begin transaction POST_Update_ODLN_Liquidacion --SE CAMBIO DE ORDR A ODLN
	if @Sociedad = 'SBO_SOLUM_BC'
	begin
		update SBO_SOLUM_BC.dbo.ODLN set 
		U_BZ_FCHEMB = case when isnull(trim(t1.U_BZ_FCHEMB),'')<>'' then t1.U_BZ_FCHEMB else t0.U_BZ_FCHEMB end,
		U_BZ_FFINAL = case when isnull(trim(t1.U_BZ_FFINAL),'')<>'' then t1.U_BZ_FFINAL else t0.U_BZ_FFINAL end,
		U_SC_HORAS_ADIC = case when isnull(trim(t1.U_SC_HORAS_ADIC),'')<>'' then t1.U_SC_HORAS_ADIC else t0.U_SC_HORAS_ADIC end,
		U_BZ_TCKFEEN = case when isnull(trim(t1.U_BZ_TCKFEEN),'')<>'' then t1.U_BZ_TCKFEEN else t0.U_BZ_TCKFEEN end,
		U_BZ_TCKHOEN = case when isnull(trim(t1.U_BZ_TCKHOEN),'')<>'' then t1.U_BZ_TCKHOEN else t0.U_BZ_TCKHOEN end,
		U_BZ_TCKFELQ = case when isnull(trim(t1.U_BZ_TCKFELQ),'')<>'' then t1.U_BZ_TCKFELQ else t0.U_BZ_TCKFELQ end,
		U_BZ_TCKHOLQ = case when isnull(trim(t1.U_BZ_TCKHOLQ),'')<>'' then t1.U_BZ_TCKHOLQ else t0.U_BZ_TCKHOLQ end,
		U_SL_FECHENVOF = case when isnull(trim(t1.U_SL_FECHENVOF),'')<>'' then t1.U_SL_FECHENVOF else t0.U_SL_FECHENVOF end,
		U_BZ_ISC = case when isnull(trim(t1.U_BZ_ISC),'')<>'' then t1.U_BZ_ISC else t0.U_BZ_ISC end,
		--
		U_BZ_CARGA = case when isnull(trim(t1.U_BZ_CARGA),'')<>'' then t1.U_BZ_CARGA end,
		U_BZ_TIPOVEH = case when isnull(trim(t1.U_BZ_TIPOVEH),'')<>'' then t1.U_BZ_TIPOVEH end,
		U_BZ_SECPEDIDO = case when isnull(trim(t1.U_BZ_SECPEDIDO),'')<>'' then t1.U_BZ_SECPEDIDO end,
		U_SYP_LUGAR_CARGA = case when isnull(trim(t1.U_SYP_LUGAR_CARGA),'')<>'' then t1.U_SYP_LUGAR_CARGA end,
		U_BZ_NAVE = case when isnull(trim(t1.U_BZ_NAVE),'')<>'' then t1.U_BZ_NAVE end,
		U_SYP_Ruta = case when isnull(trim(t1.U_SYP_Ruta),'')<>'' then t1.U_SYP_Ruta end,
		U_BZ_PLACA = case when isnull(trim(t1.U_BZ_PLACA),'')<>'' then t1.U_BZ_PLACA end,
		U_SL_RUCTRANSPORTISTA = case when isnull(trim(t1.U_SL_RUCTRANSPORTISTA),'')<>'' then t1.U_SL_RUCTRANSPORTISTA end,
		U_BZ_TRANSPORTISTA = case when isnull(trim(t1.U_BZ_TRANSPORTISTA),'')<>'' then t1.U_BZ_TRANSPORTISTA end,
		U_BPP_MDFN = case when isnull(trim(t1.U_BPP_MDFN),'')<>'' then t1.U_BPP_MDFN end,
		U_BC_ApeCond = case when isnull(trim(t1.U_BC_ApeCond),'')<>'' then t1.U_BC_ApeCond end,
		U_BC_NroDocConduc = case when isnull(trim(t1.U_BC_NroDocConduc),'')<>'' then t1.U_BC_NroDocConduc end,
		U_BPP_MDFC = case when isnull(trim(t1.U_BPP_MDFC),'')<>'' then t1.U_BPP_MDFC end,
		U_BC_TipoDocCond = case when isnull(trim(t1.U_BC_TipoDocCond),'')<>'' then t1.U_BC_TipoDocCond end,
		U_BC_TipoDocTransp = case when isnull(trim(t1.U_BC_TipoDocTransp),'')<>'' then t1.U_BC_TipoDocTransp end,
		U_tipoTransporte = case when isnull(trim(t1.U_tipoTransporte),'')<>'' then t1.U_tipoTransporte end,
		U_BZ_RESGUARDO = case when isnull(trim(t1.U_BZ_RESGUARDO),'')<>'' then t1.U_BZ_RESGUARDO end,
		U_BC_CHEKPACKING = case when isnull(trim(t1.U_BC_CHEKPACKING),'')<>'' then t1.U_BC_CHEKPACKING end,
		U_BZ_HICITA = case when isnull(trim(t1.U_BZ_HICITA),'')<>'' then t1.U_BZ_HICITA end,
		U_BZ_HFCITA = case when isnull(trim(t1.U_BZ_HFCITA),'')<>'' then t1.U_BZ_HFCITA end,
		U_TIPO_DESPA = case when isnull(trim(t1.U_TIPO_DESPA),'')<>'' then t1.U_TIPO_DESPA end
		--U_BZ_FCHEMB = case when isnull(trim(t1.U_BZ_FCHEMB),'')<>'' then t1.U_BZ_FCHEMB end,
		--U_BZ_FFINAL = case when isnull(trim(t1.U_BZ_FFINAL),'')<>'' then t1.U_BZ_FFINAL end,
		--U_SC_HORAS_ADIC = case when isnull(trim(t1.U_SC_HORAS_ADIC),'')<>'' then t1.U_SC_HORAS_ADIC end
		from SBO_SOLUM_BC.dbo.ODLN t0 inner join SOLUM_EXPRESS.dbo.SAP_HOST_LIQUIDACION t1 on t0.DocNum = t1.DocEntry and t0.Series = t1.Series
		where t1.Sociedad = @Sociedad and t1.HostGroupid = @Hostgroupid
	end
	else if @Sociedad = 'SBO_DERMO_BC'
	begin
		update SBO_DERMO_BC.dbo.ODLN set 
		U_BZ_FCHEMB = case when isnull(trim(t1.U_BZ_FCHEMB),'')<>'' then t1.U_BZ_FCHEMB else t0.U_BZ_FCHEMB end,
		U_BZ_FFINAL = case when isnull(trim(t1.U_BZ_FFINAL),'')<>'' then t1.U_BZ_FFINAL else t0.U_BZ_FFINAL end,
		U_SC_HORAS_ADIC = case when isnull(trim(t1.U_SC_HORAS_ADIC),'')<>'' then t1.U_SC_HORAS_ADIC else t0.U_SC_HORAS_ADIC end,
		U_BZ_TCKFEEN = case when isnull(trim(t1.U_BZ_TCKFEEN),'')<>'' then t1.U_BZ_TCKFEEN else t0.U_BZ_TCKFEEN end,
		U_BZ_TCKHOEN = case when isnull(trim(t1.U_BZ_TCKHOEN),'')<>'' then t1.U_BZ_TCKHOEN else t0.U_BZ_TCKHOEN end,
		U_BZ_TCKFELQ = case when isnull(trim(t1.U_BZ_TCKFELQ),'')<>'' then t1.U_BZ_TCKFELQ else t0.U_BZ_TCKFELQ end,
		U_BZ_TCKHOLQ = case when isnull(trim(t1.U_BZ_TCKHOLQ),'')<>'' then t1.U_BZ_TCKHOLQ else t0.U_BZ_TCKHOLQ end,
		U_SL_FECHENVOF = case when isnull(trim(t1.U_SL_FECHENVOF),'')<>'' then t1.U_SL_FECHENVOF else t0.U_SL_FECHENVOF end,
		U_BZ_ISC = case when isnull(trim(t1.U_BZ_ISC),'')<>'' then t1.U_BZ_ISC else t0.U_BZ_ISC end,
		--
		U_BZ_CARGA = case when isnull(trim(t1.U_BZ_CARGA),'')<>'' then t1.U_BZ_CARGA end,
		U_BZ_TIPOVEH = case when isnull(trim(t1.U_BZ_TIPOVEH),'')<>'' then t1.U_BZ_TIPOVEH end,
		U_BZ_SECPEDIDO = case when isnull(trim(t1.U_BZ_SECPEDIDO),'')<>'' then t1.U_BZ_SECPEDIDO end,
		U_SYP_LUGAR_CARGA = case when isnull(trim(t1.U_SYP_LUGAR_CARGA),'')<>'' then t1.U_SYP_LUGAR_CARGA end,
		U_BZ_NAVE = case when isnull(trim(t1.U_BZ_NAVE),'')<>'' then t1.U_BZ_NAVE end,
		U_SYP_Ruta = case when isnull(trim(t1.U_SYP_Ruta),'')<>'' then t1.U_SYP_Ruta end,
		U_BZ_PLACA = case when isnull(trim(t1.U_BZ_PLACA),'')<>'' then t1.U_BZ_PLACA end,
		--U_SL_RUCTRANSPORTISTA = case when isnull(trim(t1.U_SL_RUCTRANSPORTISTA),'')<>'' then t1.U_SL_RUCTRANSPORTISTA end,
		U_BZ_TRANSPORTISTA = case when isnull(trim(t1.U_BZ_TRANSPORTISTA),'')<>'' then t1.U_BZ_TRANSPORTISTA end,
		U_BPP_MDFN = case when isnull(trim(t1.U_BPP_MDFN),'')<>'' then t1.U_BPP_MDFN end,
		--U_BC_ApeCond = case when isnull(trim(t1.U_BC_ApeCond),'')<>'' then t1.U_BC_ApeCond end,
		--U_BC_NroDocConduc = case when isnull(trim(t1.U_BC_NroDocConduc),'')<>'' then t1.U_BC_NroDocConduc end,
		U_BPP_MDFC = case when isnull(trim(t1.U_BPP_MDFC),'')<>'' then t1.U_BPP_MDFC end,
		--U_BC_TipoDocCond = case when isnull(trim(t1.U_BC_TipoDocCond),'')<>'' then t1.U_BC_TipoDocCond end,
		--U_BC_TipoDocTransp = case when isnull(trim(t1.U_BC_TipoDocTransp),'')<>'' then t1.U_BC_TipoDocTransp end,
		--U_tipoTransporte = case when isnull(trim(t1.U_tipoTransporte),'')<>'' then t1.U_tipoTransporte end,
		--U_BZ_RESGUARDO = case when isnull(trim(t1.U_BZ_RESGUARDO),'')<>'' then t1.U_BZ_RESGUARDO end,
		U_BC_CHEKPACKING = case when isnull(trim(t1.U_BC_CHEKPACKING),'')<>'' then t1.U_BC_CHEKPACKING end,
		U_BZ_HICITA = case when isnull(trim(t1.U_BZ_HICITA),'')<>'' then t1.U_BZ_HICITA end,
		U_BZ_HFCITA = case when isnull(trim(t1.U_BZ_HFCITA),'')<>'' then t1.U_BZ_HFCITA end,
		U_TIPO_DESPA = case when isnull(trim(t1.U_TIPO_DESPA),'')<>'' then t1.U_TIPO_DESPA end
		--U_BZ_FCHEMB = case when isnull(trim(t1.U_BZ_FCHEMB),'')<>'' then t1.U_BZ_FCHEMB end,
		--U_BZ_FFINAL = case when isnull(trim(t1.U_BZ_FFINAL),'')<>'' then t1.U_BZ_FFINAL end,
		--U_SC_HORAS_ADIC = case when isnull(trim(t1.U_SC_HORAS_ADIC),'')<>'' then t1.U_SC_HORAS_ADIC end
		from SBO_DERMO_BC.dbo.ODLN t0 inner join SOLUM_EXPRESS.dbo.SAP_HOST_LIQUIDACION t1 on t0.DocNum = t1.DocEntry and t0.Series = t1.Series
		where t1.Sociedad = @Sociedad and t1.HostGroupid = @Hostgroupid
	end
	set @tipo = 'success'
	set @titulo = 'CORRECTO!!'
	set @mensaje = 'REGISTRO CORRECTO.'
	commit transaction POST_Update_ODLN_Liquidacion
end try
begin catch
	if @@TRANCOUNT > 0
	begin
		set @tipo = 'error'
		set @titulo = 'ERROR!!'
		set @mensaje = 'REGISTO INCORRECTO. ' + ERROR_MESSAGE() + ' OBJETO. ' + ERROR_PROCEDURE() + '. Error line: ' + cast(ERROR_LINE() AS NVARCHAR(6))
		rollback transaction POST_Update_ODLN_Liquidacion
	end
end catch
select @tipo tipo,@titulo titulo,@mensaje mensaje
end
go
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
select Code,U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,format(fechainicio,'yyyy-MM-dd') fechainicio,format(fechafin,'yyyy-MM-dd') fechafin,
ultimoproceso from [@EX_PLANIFICADO] where state = 0 and U_EX_PROCESO in ('SAP_UPDATE_DESPACHO','SAP_UPDATE_LIQUIDACION') order by [Code]

select Code,U_EX_CLIENTE,U_EX_PROCESO,tipo,hora,minuto,lunes,martes,miercoles,jueves,viernes,sabado,domingo,modalidad,titulo,datos,format(fechainicio,'yyyy-MM-dd') fechainicio,format(fechafin,'yyyy-MM-dd') fechafin,ultimoproceso from [@EX_PLANIFICADO]
where state = 0 and U_EX_PROCESO in ('SAP_UPDATE_DESPACHO','SAP_UPDATE_LIQUIDACION') order by [Code]

exec BZ_JEPM_Actualizar_despacho_ORDR 'SBO_SOLUM_BC', '20240511121737087' 
select Code, Class, Name,Company from [@EX_CLIENTE]
