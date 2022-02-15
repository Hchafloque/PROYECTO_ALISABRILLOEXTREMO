CREATE TABLE  tb_det_proveedor  (
   cod_detp  char(5) NOT NULL,
   cod_pro  char(6) not NULL,
   cantidad  int DEFAULT NULL,
   precioCompra  decimal(8,2) DEFAULT NULL,
   importe  decimal(8,2) DEFAULT NULL,
  PRIMARY KEY ( cod_detp ),
  --KEY  cod_pro  ( cod_pro ),
  
) 
alter table tb_det_proveedor
add CONSTRAINT  tb_det_proveedor_prov  FOREIGN KEY ( cod_pro ) REFERENCES  tb_proveedor  ( cod_prov )


DROP TABLE IF EXISTS  tb_red_social ;

CREATE TABLE  tb_red_social  (
   red_social  int NOT NULL,
   nombre  varchar(30) NOT NULL,
  PRIMARY KEY ( red_social )
)
INSERT INTO  tb_red_social  VALUES (1,'Pagina Fc'),(2,'WhatsApp'),(3,'Instagram'),(4,'Facebook');


DROP TABLE IF EXISTS  tb_clientes ;

CREATE TABLE  tb_clientes  (
   cod_cli  int NOT NULL ,
   nombre  varchar(50) NOT NULL,
   apellido  varchar(50) NOT NULL,
   dni  char(8) DEFAULT NULL,
   fecha_cita  date NOT NULL,
   telefono  char(9) NOT NULL DEFAULT '000000000',
   hora  varchar(30) NOT NULL,
   correo  varchar(100) DEFAULT NULL,
   Red_social  int DEFAULT NULL,
  PRIMARY KEY ( cod_cli ),
  --KEY  fk_cliente_redsocial  ( Red_social ),
  CONSTRAINT  fk_cliente_redsocial  FOREIGN KEY ( Red_social ) REFERENCES  tb_red_social  ( red_social )
)


DROP TABLE IF EXISTS  tipo_alisado ;

CREATE TABLE  tipo_alisado  (
   cod_tipo  int NOT NULL ,
   nom_tipo  varchar(30) NOT NULL,
  PRIMARY KEY ( cod_tipo )
) 

DROP TABLE IF EXISTS  tb_tipousuario ;

CREATE TABLE  tb_tipousuario  (
   cod_tipoUsu  int NOT NULL,
   descripcion_tipoUsu  varchar(20) DEFAULT NULL,
  PRIMARY KEY ( cod_tipoUsu )
) 


INSERT INTO  tb_tipousuario  VALUES (1,'Administrador'),(2,'Usuario');

CREATE TABLE  tb_usuarios  (
   cod_usuario  int NOT NULL ,
   nombre  varchar(15) NOT NULL,
   apellido  varchar(25) NOT NULL,
   usuario  varchar(30) NOT NULL,
   clave  varchar(30) NOT NULL,
   fec_session  datetime DEFAULT NULL,
   cod_tipoUsu  int DEFAULT NULL,
  PRIMARY KEY ( cod_usuario ),
  --KEY  cod_tipoUsu  ( cod_tipoUsu ),
  CONSTRAINT  tb_usuarios_ibfk_1  FOREIGN KEY ( cod_tipoUsu ) REFERENCES  tb_tipousuario  ( cod_tipoUsu )
) 




INSERT INTO  tb_usuarios  VALUES (1,'herbert','chafloque','herbert','dayhana03','2021-07-10 00:47:17',1),(2,'Maribel','Vargas','Alvarado','dayhana03','2022-02-05 00:00:00',1),(3,'dfv','dfvd','fvdfvdfvdf','vdfvd','2022-02-11 00:00:00',1),(4,'FWEFWEFWE','WEFWEFWE','WEFWEFWE','FWEF','2022-02-22 00:00:00',2);

DROP TABLE IF EXISTS tb_alisado

CREATE TABLE tb_alisado (
  cod_alisado  int NOT NULL ,
   cod_tipo  int NOT NULL,
   precio  decimal(10,0) NOT NULL,
   cod_cli  int DEFAULT NULL,
   cantidad  int DEFAULT NULL,
  PRIMARY KEY ( cod_alisado ),
  --KEY  cod_cli  ( cod_cli ),
  --KEY  fk_alisado_tipo  ( cod_tipo ),
  CONSTRAINT  fk_alisado_tipo  FOREIGN KEY ( cod_tipo ) REFERENCES  tipo_alisado  ( cod_tipo ),
  CONSTRAINT  tb_alisado_ibfk_1  FOREIGN KEY ( cod_cli ) REFERENCES  tb_clientes  ( cod_cli )
) 
INSERT INTO  tb_alisado  VALUES (1,2,100,NULL,NULL),(2,2,180,NULL,NULL),(3,5,180,NULL,NULL),(4,6,500,NULL,NULL);

DROP TABLE IF EXISTS  tb_boleta ;

CREATE TABLE  tb_boleta  (
   num_bol  char(5) NOT NULL,
   fch_bol  date DEFAULT NULL,
   cod_cli  int NOT NULL,
   cod_usu  int NOT NULL,
   total_bol  decimal(8,2) DEFAULT NULL,
  PRIMARY KEY ( num_bol ),
  --foreign KEY  cod_cli  ( cod_cli ),
  --foreign KEY  cod_usu  ( cod_usu ),
  CONSTRAINT  tb_boleta_ibfk_1  FOREIGN KEY ( cod_cli ) REFERENCES  tb_clientes  ( cod_cli ),
  CONSTRAINT  tb_boleta_ibfk_2  FOREIGN KEY ( cod_usu ) REFERENCES  tb_usuarios  ( cod_usuario )
) 



INSERT INTO  tb_boleta  VALUES ('B0001','2022-02-06',3,1,22.00),('B0002','2022-02-06',3,1,75.00),('B0003','2022-02-06',3,1,161.00),('B0004','2022-02-06',3,1,150.00),('B0005','2022-02-06',3,1,375.00),('B0006','2022-02-06',3,1,150.00);


DROP TABLE IF EXISTS  tb_categoriaproducto ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE  tb_categoriaproducto  (
   cod_Cate  int NOT NULL,
   descripcion  varchar(30) NOT NULL,
  PRIMARY KEY ( cod_Cate )
)

INSERT INTO  tb_categoriaproducto  VALUES (1,'Brasilero'),(2,'Egipcio'),(3,'Multivitaminico'),(4,'Italiano'),(5,'Dual Gel'),(6,'Japones'),(7,'Mixto'),(8,'Matizador'),(9,'Trial'),(10,'Alisa Brillo Extremo'),(11,'Espejo'),(12,'Chao Mota'),(13,'Botox Organico'),(14,'Botox Matizador'),(15,'Hidratacion'),(16,'Shampoo B'),(17,'Shampoo C'),(18,'Shampoo G'),(19,'Shampoo K'),(20,'Acondicionador B'),(21,'Acondicionador C'),(22,'Acondicionador G'),(23,'Acondicionador K'),(24,'Mascarilla B'),(25,'Mascarilla C'),(26,'Mascarilla G'),(27,'Mascarilla K'),(28,'Hydro');


DROP TABLE IF EXISTS  tb_citacancelada ;

CREATE TABLE  tb_citacancelada  (
   cod_cancelada  int NOT NULL,
   cod_cliente  int DEFAULT NULL,
   cantidad  int DEFAULT NULL,
  PRIMARY KEY ( cod_cancelada ),
  --KEY  fk_Cancelada_cliente  ( cod_cliente ),
  CONSTRAINT  fk_Cancelada_cliente  FOREIGN KEY ( cod_cliente ) REFERENCES  tb_clientes  ( cod_cli )
)


INSERT INTO  tb_citacancelada  VALUES (1,1,3),(2,1,1),(3,2,1),(4,2,1),(5,2,1),(6,1,1),(7,2,1),(8,2,1),(9,2,1),(10,2,1),(11,2,1),(12,2,1),(13,2,1),(14,2,1),(15,2,1),(16,2,1),(17,2,1),(18,2,1),(19,2,1),(20,2,1),(21,2,1),(22,2,1),(23,2,1),(24,2,1),(25,2,1),(26,2,1),(27,2,1),(28,2,1),(29,2,1),(30,2,1),(31,2,1),(32,2,1),(33,2,1),(34,2,1),(35,2,1),(36,1,1),(37,2,1),(38,2,1),(39,1,1),(40,2,1),(41,2,1),(42,3,1);


DROP TABLE IF EXISTS  tb_proveedor ;

CREATE TABLE  tb_proveedor  (
   cod_prov  char(6) NOT NULL,
   raz_social  varchar(50) NOT NULL,
   producto  varchar(50) NOT NULL,
   dir_prov  varchar(100) DEFAULT NULL,
   fecha_comp  date NOT NULL,
  PRIMARY KEY ( cod_prov )
) 




DROP TABLE IF EXISTS  tb_citaconfirmada ;

CREATE TABLE  tb_citaconfirmada  (
   cod_confirmada  int NOT NULL ,
   cod_cliente  int DEFAULT NULL,
   cantidad  int DEFAULT NULL,
  PRIMARY KEY ( cod_confirmada ),
 -- KEY  fk_Confirmada_cliente  ( cod_cliente ),
  CONSTRAINT  fk_Confirmada_cliente  FOREIGN KEY ( cod_cliente ) REFERENCES  tb_clientes  ( cod_cli )
) 
INSERT INTO  tb_citaconfirmada  VALUES (3,3,1),(4,3,1);

DROP TABLE IF EXISTS  tb_citareagendada ;

CREATE TABLE  tb_citareagendada  (
   cod_reagendada  int NOT NULL ,
   cod_cliente  int DEFAULT NULL,
   cantidad  int DEFAULT NULL,
  PRIMARY KEY ( cod_reagendada ),
 -- KEY  fk_Reagendada_cliente  ( cod_cliente ),
  CONSTRAINT  fk_Reagendada_cliente  FOREIGN KEY ( cod_cliente ) REFERENCES  tb_clientes  ( cod_cli )
) 

INSERT INTO  tb_citareagendada  VALUES (1,2,1),(2,2,1),(3,1,1);


INSERT INTO  tb_clientes  VALUES (1,'hola','mmm','12345678','2021-07-10','13646','5:00','jbcoiwbcd',2),(2,'herbert','Chafloque','46233731','2021-07-10','Cortez2','8am','herchaf.3.13@gmail.com',4),(3,'dayhana','chafloque vargas','12345678','2022-02-06','123456789','5:00 pm','dayhana@gmail.com',2);

DROP TABLE IF EXISTS  tb_det_boleta ;

CREATE TABLE  tb_det_boleta  (
   num_bol  char(5) NOT NULL,
   cod_pro  char(5) NOT NULL,
   cantidad  int DEFAULT NULL,
   preciovta  decimal(8,2) DEFAULT NULL,
   importe  decimal(8,2) DEFAULT NULL,
  PRIMARY KEY ( num_bol , cod_pro ),
  --KEY  cod_pro  ( cod_pro ),
  CONSTRAINT  tb_det_boleta_ibfk_1  FOREIGN KEY ( num_bol ) REFERENCES  tb_boleta  ( num_bol )
) 

INSERT INTO  tb_det_boleta  VALUES ('B0001','P0003',2,11.00,22.00),('B0002','P0002',1,75.00,75.00),('B0003','P0002',2,75.00,150.00),('B0003','P0003',1,11.00,11.00),('B0004','P0002',2,75.00,150.00),('B0005','P0002',5,75.00,375.00),('B0006','P0002',2,75.00,150.00);


CREATE TABLE  tb_morosos  (
   cod_moroso  int NOT NULL,
   cod_cliente  int DEFAULT NULL,
   cantidad  int DEFAULT NULL,
  PRIMARY KEY ( cod_moroso ),
  --KEY  fk_morosos_cliente  ( cod_cliente ),
  CONSTRAINT  fk_morosos_cliente  FOREIGN KEY ( cod_cliente ) REFERENCES  tb_clientes  ( cod_cli )
)

DROP TABLE IF EXISTS  tb_personal ;

CREATE TABLE  tb_personal  (
   cod_empleado  int NOT NULL ,
   nombre  varchar(50) NOT NULL,
   apellido  varchar(50) NOT NULL,
   direccion  varchar(50) DEFAULT NULL,
   telefono  char(9) DEFAULT '000000000',
   correo  varchar(50) DEFAULT NULL,
   dni  char(8) DEFAULT NULL,
   fecha  date DEFAULT NULL,
  PRIMARY KEY ( cod_empleado ),
  --KEY  cod_tipo  ( dni )
) 
INSERT INTO  tb_personal  VALUES (1,'QWDQW','WDQ','WDQWQD','147258369','DWQDWQ','12345678','2021-07-14'),(2,'herbertt','chafloque','WDQWQD','147258369','DWQDWQ','12345678','2021-07-14');

DROP TABLE IF EXISTS  tb_posalisado ;

CREATE TABLE  tb_posalisado  (
   cod_pos  int NOT NULL ,
   cod_cliente  int NOT NULL,
   fecha  date NOT NULL,
   hora  varchar(15) DEFAULT NULL,
  PRIMARY KEY ( cod_pos ),
  --KEY  fk_posAlisado_cliente  ( cod_cliente ),
  CONSTRAINT  fk_posAlisado_cliente  FOREIGN KEY ( cod_cliente ) REFERENCES  tb_clientes  ( cod_cli )
) 

INSERT INTO  tb_posalisado  VALUES (1,2,'2021-07-13','10:00am'),(2,2,'2021-07-14','10am'),(3,2,'2021-07-15','6pm');

DROP TABLE IF EXISTS  tb_productos ;

CREATE TABLE  tb_productos  (
   cod_pro  char(5) NOT NULL,
   stock  int DEFAULT NULL,
   precio  decimal(8,2) DEFAULT NULL,
   fecha_venci  date NOT NULL,
   cod_cat  int DEFAULT NULL,
   precio_venta  decimal(8,2) DEFAULT NULL,
  PRIMARY KEY ( cod_pro ),
  --KEY  fk_prodducto_categoria  ( cod_cat ),
  CONSTRAINT  fk_prodducto_categoria  FOREIGN KEY ( cod_cat ) REFERENCES  tb_categoriaproducto  ( cod_Cate )
) 

INSERT INTO  tb_productos  VALUES ('P0001',100,100.00,'2023-02-06',1,100.00),('P0002',100,180.00,'2023-02-06',2,180.00),('P0003',100,180.00,'2023-02-06',3,180.00),('P0004',100,200.00,'2023-02-06',4,200.00),('P0005',100,230.00,'2023-02-06',5,2330.00),('P0006',100,250.00,'2023-02-06',6,250.00),('P0007',100,300.00,'2023-02-06',7,300.00),('P0008',100,300.00,'2023-02-06',8,300.00),('P0009',100,350.00,'2023-02-06',9,350.00),('P0010',100,400.00,'2023-02-06',10,400.00),('P0011',100,500.00,'2023-02-06',11,500.00),('P0012',100,600.00,'2023-02-06',12,600.00),('P0013',100,150.00,'2023-02-06',13,150.00),('P0014',100,150.00,'2023-02-06',14,150.00),('P0015',100,70.00,'2023-02-06',15,70.00),('P0016',100,80.00,'2023-02-06',16,80.00),('P0017',100,80.00,'2023-02-06',17,80.00),('P0018',100,80.00,'2023-02-06',18,80.00),('P0019',100,80.00,'2023-02-06',19,80.00),('P0020',100,70.00,'2023-02-06',20,70.00),('P0021',100,70.00,'2023-02-06',21,70.00),('P0022',100,70.00,'2023-02-06',22,70.00),('P0023',100,70.00,'2023-02-06',23,70.00),('P0024',100,70.00,'2023-02-06',24,70.00),('P0025',100,70.00,'2023-02-06',25,70.00),('P0026',100,70.00,'2023-02-06',26,70.00),('P0027',100,70.00,'2023-02-06',27,70.00),('P0028',100,80.00,'2023-02-06',28,80.00);

DROP TABLE IF EXISTS  tb_tipopersonal ;

CREATE TABLE  tb_tipopersonal  (
   cod_tipo  int NOT NULL,
   descripcion  varchar(50) DEFAULT NULL,
  PRIMARY KEY ( cod_tipo )
)


DROP TABLE IF EXISTS  tb_tratamientos ;

CREATE TABLE  tb_tratamientos  (
   cod_tratamiento  char(5) NOT NULL,
   stock  int DEFAULT NULL,
   precio  decimal(8,2) DEFAULT NULL,
   fecha_venci  date NOT NULL,
   cod_tipo  int DEFAULT NULL,
   precio_venta  decimal(8,2) DEFAULT NULL,
  PRIMARY KEY ( cod_tratamiento ),
  --KEY  cod_tipo  ( cod_tipo ),
  CONSTRAINT  tb_tratamientos_ibfk_1  FOREIGN KEY ( cod_tipo ) REFERENCES  tipo_alisado  ( cod_tipo )
) 
INSERT INTO  tb_tratamientos  VALUES ('A0001',20,52.00,'2022-02-06',2,80.00),('A0002',582,100.00,'2022-02-17',4,150.00),('A0003',52,20.00,'2022-02-06',2,50.00);




INSERT INTO  tipo_alisado  VALUES (1,'Brasilero'),(2,'Egipcio'),(3,'Multivitaminico'),(4,'Italiano'),(5,'Dual Gel'),(6,'Japones'),(7,'Mixto'),(8,'Trial'),(9,'Alisa Brillo Extremo'),(10,'Espejo'),(11,'Botox Capilar'),(12,'Botox Matizador'),(13,'Hidratacion');


