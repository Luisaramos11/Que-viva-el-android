USE `consulta`;
DROP procedure IF EXISTS `insert_fabricantes`;

DELIMITER $$
USE `consulta`$$
CREATE PROCEDURE insert_fabricantes (
IN nom varchar (100)
)
BEGIN
INSERT INTO Fabricantes (nombre) 
VALUES (nom);

END$$

DELIMITER ;

USE `consulta`;
DROP procedure IF EXISTS `insert_productos`;

DELIMITER $$
USE `consulta`$$
CREATE PROCEDURE insert_productos (
IN nom varchar (100),
IN pre double ,
IN cog_fabricante int
)
BEGIN
insert into Productos (nombre,precio,codigo_fabricante)
values (nom,pre,cog_fabricante);
END$$

DELIMITER ;
