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

#16
SELECT * FROM fabricantes LIMIT 5;

#17
SELECT * FROM fabricantes LIMIT 2 OFFSET 3; 

#18
SELECT nombre,precio FROM productos
ORDER BY precio DESC
LIMIT 1;

#19
SELECT nombre,precio FROM productos
ORDER BY precio ASC
LIMIT 1;

#20
SELECT nombre FROM productos 
WHERE codigo_fabricante = 2;

#21
SELECT nombre, precio FROM productos
WHERE precio*0.89 <= 120;

#22
SELECT nombre, precio FROM productos
WHERE precio*0.89 >= 400;

#23
SELECT nombre, precio FROM productos
WHERE precio*0.89 < 400;

#24
SELECT * FROM productos
WHERE precio *0.89>= 80 AND precio <= 300;

#25
SELECT * FROM productos
WHERE precio *0.89 BETWEEN 60 AND 200;

#26
SELECT * FROM productos
WHERE precio *0.89 >200 AND codigo_fabricante =6;

#27
SELECT * FROM productos 
WHERE codigo_fabricante =1 OR codigo_fabricante =3 OR codigo_fabricante=5;

#28
SELECT * FROM productos
WHERE codigo_fabricante IN(1,3,5);

#29
SELECT nombre, precio*100 
AS centimos
FROM productos;

#30
SELECT nombre FROM fabricantes
WHERE nombre LIKE 'S%';

#31
SELECT nombre FROM fabricantes
WHERE nombre LIKE 'E%';

#32
SELECT nombre FROM fabricantes
WHERE nombre LIKE '%W%';

#33
SELECT nombre FROM fabricantes
WHERE LENGTH(nombre) = 4;

#34
SELECT nombre
FROM productos
WHERE nombre LIKE '%Portátil%';

#35 
SELECT nombre, precio
FROM productos
WHERE nombre LIKE '%Monitor%'AND precio*0.89<215;

#36
SELECT precio FROM productos
WHERE precio*0.89 >=180 
ORDER BY precio DESC;
SELECT nombre FROM productos
ORDER BY nombre ASC;

#1.1.4

#1
SELECT p.nombre, p.precio, f.nombre FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante=f.codigo;

#2
SELECT p.nombre, p.precio,f.nombre FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

#3
SELECT p.codigo AS codigo_producto, p.nombre AS nombre, f.codigo AS codigo_fabricante, f.nombre AS nombre
FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante = f.codigo;

#4
SELECT p.nombre, p.precio,f.nombre
FROM productos AS p
JOIN fabricantes AS f 
ORDER BY precio DESC ;

#5
SELECT p.precio,f.nombre
FROM productos AS p
JOIN fabricantes AS f
ORDER BY precio ASC ;

#6
SELECT p.codigo, p.precio, p.nombre, f.nombre
FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

#7
SELECT p.codigo, p.precio, p.nombre, f.nombre
FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND precio*0.89> 200;

#8
SELECT p.codigo, p.precio, p.nombre, f.nombre
FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

#9
SELECT p.codigo, p.precio, p.nombre, f.nombre
FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus','Hewlett-Packard','Seagate');

#10
SELECT p.nombre, p.precio, f.nombre FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante=f.codigo;
SELECT * FROM fabricantes WHERE nombre LIKE '%e';

#11
SELECT p.nombre, p.precio, f.nombre FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante=f.codigo;
SELECT * FROM fabricantes WHERE nombre LIKE '%W%';

#12
SELECT p.nombre, p.precio, f.nombre FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante=f.codigo
WHERE precio*0.89 >=180 
ORDER BY p.precio DESC; 
SELECT p.nombre FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante=f.codigo
ORDER BY p.nombre ASC;

#13
SELECT f.codigo, f.nombre FROM productos AS p
JOIN fabricantes AS f ON p.codigo_fabricante=f.codigo;

#1.1.5

#1
SELECT f.nombre, p.nombre FROM fabricantes AS f
LEFT JOIN productos AS p ON f.codigo = p.codigo_fabricante;

#2
SELECT f.nombre, p.nombre FROM fabricantes AS f
RIGHT JOIN productos AS p ON f.codigo = p.codigo_fabricante;

#1.1.6

#1
SELECT COUNT(*) AS total_productos
FROM productos;

#2
SELECT COUNT(*) AS total_fabricantes
FROM fabricantes;

#3
SELECT COUNT(DISTINCT codigo_fabricante) AS fabricantes_distintos
FROM productos;

#4
SELECT AVG(precio) AS media_precio
FROM productos;

#5
SELECT MIN(precio) AS precio_mas_barato
FROM productos;

#6
SELECT MAX(precio) AS precio_mas_barato
FROM productos;

#7
SELECT MIN(precio), nombre AS precio_mas_barato
FROM productos;

#8
SELECT MAX(precio), nombre AS precio_mas_barato
FROM productos;

#9
SELECT SUM(precio) AS precio_productos
FROM productos;

#10
SELECT COUNT(DISTINCT "Asus") AS fabricantes_distintos
FROM productos;

#11
SELECT AVG(DISTINCT precio) AS media_precio
FROM productos
WHERE codigo_fabricante 
SELECT codigo FROM fabricantes WHERE nombre = 'Asus');













