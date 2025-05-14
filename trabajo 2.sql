CALL insert_fabricantes ("Asus");
CALL insert_fabricantes("Lenovo");
CALL insert_fabricantes("Hewlett-Packard");
CALL insert_fabricantes("Samsung");
CALL insert_fabricantes("Seagate");
CALL insert_fabricantes("Crucial");
CALL insert_fabricantes("Gigabyte");
CALL insert_fabricantes("Huawei");
CALL insert_fabricantes("Xiaomi");      


CALL insert_productos ("Disco duro SATA3 1TB",86.99);
CALL insert_productos("Memoria RAM DDR4 8GB",120);
CALL insert_productos("Disco SSD 1 TB",150.99);
CALL insert_productos("GeForce GTX 1050Ti",185);
CALL insert_productos("GeForce GTX 1080 Xtreme",755);
CALL insert_productos("Monitor 24 LED Full HD",202);
CALL insert_productos("Monitor 27 LED Full HD",245.99);
CALL insert_productos("Portatil Yoga 520",559);
CALL insert_productos("Portatil Ideapd 320",444);
CALL insert_productos("Impresora HP Dskjet 3720",59.99);
CALL insert_productos("Impresora HP Laserjet Pro M26nw",180);

#1
SELECT nombre from productos
#2
SELECT nombre, precio from productos
#3
SELECT codigo, nombre, precio, codigo_fabricante from productos
#4 
SELECT nombre AS nombre_producto,
  precio AS precio_eur,
  precio * 1.10 AS precio_usd
FROM productos;




