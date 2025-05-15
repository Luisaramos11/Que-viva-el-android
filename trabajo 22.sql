CALL insert_fabricantes ("Asus");
CALL insert_fabricantes("Lenovo");
CALL insert_fabricantes("Hewlett-Packard");
CALL insert_fabricantes("Samsung");
CALL insert_fabricantes("Seagate");
CALL insert_fabricantes("Crucial");
CALL insert_fabricantes("Gigabyte");
CALL insert_fabricantes("Huawei");
CALL insert_fabricantes("Xiaomi");      


CALL insert_productos ("Disco duro SATA3 1TB", 86.99, 5);
CALL insert_productos("Memoria RAM DDR4 8GB",120,6 );
CALL insert_productos("Disco SSD 1 TB",150.99, 4);
CALL insert_productos("GeForce GTX 1050Ti",185, 7);
CALL insert_productos("GeForce GTX 1080 Xtreme",755, 6);
CALL insert_productos("Monitor 24 LED Full HD",202, 1);
CALL insert_productos("Monitor 27 LED Full HD",245.99, 1);
CALL insert_productos("Portatil Yoga 520",559, 2);
CALL insert_productos("Portatil Ideapd 320",444, 2);
CALL insert_productos("Impresora HP Dskjet 3720",59.99, 3);
CALL insert_productos("Impresora HP Laserjet Pro M26nw",180, 3);


#1
SELECT nombre from productos;
#2
SELECT nombre, precio from productos;
#3
SELECT * from productos;
#4 
SELECT nombre,
  precio,
  precio * 0.89 
FROM productos;
#5
SELECT nombre AS nombre_de_producto,
precio * 0.89 AS euros,
precio AS dolares
FROM productos;
#6
SELECT nombre, UPPER (nombre),
precio
FROM productos;
#7
SELECT nombre, LOWER (nombre),
precio
FROM productos;
#8
SELECT CONCAT(UPPER(LEFT(nombre, 2)), LOWER(SUBSTR(nombre, 3)))
FROM fabricantes;
#9
SELECT ROUND(precio, -1) AS precio_redondeado 
FROM productos;
#10
SELECT nombre, TRUNCATE(precio,0) FROM productos;
#11
SELECT codigo_fabricante
FROM productos;
#12
SELECT DISTINCT codigo_fabricante
FROM productos;
#13
SELECT nombre 
FROM fabricantes
ORDER BY nombre ASC;
#14
SELECT nombre
 FROM fabricantes
ORDER BY nombre DESC;
#15
SELECT nombre
FROM productos
ORDER BY nombre ASC;
SELECT precio
FROM productos
ORDER BY precio DESC;




