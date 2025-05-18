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
SELECT AVG(precio) AS media_precio
FROM productos
WHERE codigo_fabricante IN (
  SELECT codigo
  FROM fabricantes
  WHERE nombre = 'Asus'
);

#12
SELECT MIN(p.precio) AS precio_minimo
FROM productos p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

#13
SELECT MAX(p.precio) AS precio_caro
FROM productos p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

#14
SELECT SUM(p.precio) AS suma_total
FROM productos p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

#15
SELECT
  MAX(p.precio) AS precio_maximo,
  MIN(p.precio) AS precio_minimo,
  AVG(p.precio) AS precio_promedio,
  COUNT(*) AS total_productos
FROM productos p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial';

#16
SELECT f.nombre AS fabricante, COUNT(p.codigo) AS total_productos
FROM fabricantes f
LEFT JOIN productos p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
ORDER BY total_productos DESC;

#17
SELECT f.nombre AS fabricante,
MAX(p.precio) AS precio_maximo,
MIN(p.precio) AS precio_minimo,
AVG(p.precio) AS precio_promedio
FROM fabricantes f
LEFT JOIN productos p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

#18
SELECT p.codigo_fabricante AS id_fabricante,
MAX(p.precio) AS precio_maximo,
MIN(p.precio) AS precio_minimo,
AVG(p.precio) AS precio_promedio,
COUNT(p.codigo) AS total_productos
FROM productos p
GROUP BY p.codigo_fabricante
HAVING AVG(p.precio) > 200;

#19
SELECT f.nombre AS fabricante,
MAX(p.precio) AS precio_maximo,
MIN(p.precio) AS precio_minimo,
AVG(p.precio) AS precio_promedio,
COUNT(p.codigo) AS total_productos
FROM fabricantes f
INNER JOIN productos p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

#20
SELECT COUNT(*) AS total_productos
FROM productos
WHERE precio >= 180;

#21
SELECT f.nombre AS fabricante,
       COUNT(p.codigo) AS total_productos
FROM fabricantes f
LEFT JOIN productos p ON f.codigo = p.codigo_fabricante AND p.precio >= 180
GROUP BY f.nombre
ORDER BY total_productos DESC;

#22
SELECT codigo_fabricante AS id_fabricante,
AVG(precio) AS precio_medio
FROM productos
GROUP BY codigo_fabricante;

#23
SELECT f.nombre AS fabricante,
AVG(p.precio) AS precio_medio
FROM fabricantes f
LEFT JOIN productos p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

#24
SELECT f.nombre AS fabricante
FROM fabricantes f
JOIN productos p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) >= 150;

#25
SELECT f.nombre AS fabricante
FROM fabricantes f
JOIN productos p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo) >= 2;

#26
SELECT f.nombre AS fabricante,
COUNT(p.codigo) AS total_productos
FROM fabricantes f
JOIN productos p ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 220
GROUP BY f.nombre
ORDER BY total_productos DESC;

#27
SELECT f.nombre AS fabricante,
COUNT(p.codigo) AS total_productos
FROM fabricantes f
LEFT JOIN productos p ON f.codigo = p.codigo_fabricante AND p.precio >= 220
GROUP BY f.nombre
ORDER BY total_productos DESC;

#28
SELECT f.nombre AS fabricante,
SUM(p.precio) AS suma_total
FROM fabricantes f
JOIN productos p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING SUM(p.precio) > 1000;

#29
SELECT p.nombre AS producto,
p.precio,
f.nombre AS fabricante
FROM productos p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE p.precio = (
SELECT MAX(p2.precio)
FROM productos p2
WHERE p2.codigo_fabricante = p.codigo_fabricante
)
ORDER BY f.nombre;

#1.1.7.1
#1
SELECT * 
FROM productos 
WHERE codigo_fabricante = (
SELECT codigo 
FROM fabricantes 
WHERE nombre = 'Lenovo'
);

#2
SELECT *
FROM productos
WHERE precio = (
SELECT MAX(precio)
FROM productos
WHERE codigo_fabricante = (
SELECT codigo
FROM fabricantes
WHERE nombre = 'Lenovo'
    )
);

#3
SELECT nombre
FROM productos
WHERE precio = (
 SELECT MAX(precio)
    FROM productos
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Lenovo'
    )
);

#4
SELECT nombre
FROM productos
WHERE precio = (
    SELECT MIN(precio)
    FROM productos
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Hewlett-Packard'
    )
);

#5
SELECT *
FROM productos
WHERE precio >= (
    SELECT MAX(precio)
    FROM productos
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Lenovo'
    )
);

#6
SELECT *
FROM productos
WHERE precio > (
    SELECT AVG(precio)
    FROM productos
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Asus'
    )
)
AND codigo_fabricante = (
    SELECT codigo
    FROM fabricantes
    WHERE nombre = 'Asus'
);

#1.1.7.2
#7
SELECT *
FROM producto
WHERE precio >= ALL (SELECT precio FROM producto);

#8
SELECT *
FROM producto
WHERE precio <= ALL (SELECT precio FROM producto);

#9
SELECT nombre
FROM fabricantes
WHERE codigo = ANY (
SELECT codigo_fabricante
FROM productos
);

#10
SELECT nombre
FROM fabricantes
WHERE codigo != ALL (
SELECT codigo_fabricante
FROM productos
);

#1.1.7.3
#11
SELECT nombre
FROM fabricantes
WHERE codigo IN (
SELECT codigo_fabricante
FROM productos
);

#12
SELECT nombre
FROM fabricantes
WHERE codigo NOT IN (
SELECT codigo_fabricante
FROM productos
);

#1.1.7.4
#13
SELECT nombre
FROM fabricantes f
WHERE EXISTS (
SELECT 1
FROM productos p
WHERE p.codigo_fabricante = f.codigo
);

#14
SELECT nombre
FROM fabricantes f
WHERE NOT EXISTS (
SELECT 1
FROM productos p
WHERE p.codigo_fabricante = f.codigo
);

#1.1.7.5
#15
SELECT f.nombre AS fabricante, p.nombre AS producto, p.precio
FROM fabricante f
JOIN producto p ON p.codigo_fabricante = f.codigo
WHERE p.precio = (
SELECT MAX(p2.precio)
FROM producto p2
WHERE p2.codigo_fabricante = f.codigo
);

#16
SELECT p.nombre, p.precio, p.codigo_fabricante
FROM producto p
WHERE p.precio >= (
SELECT AVG(p2.precio)
FROM producto p2
WHERE p2.codigo_fabricante = p.codigo_fabricante
);

#17
SELECT p.nombre
FROM producto p
WHERE p.precio = (
SELECT MAX(p2.precio)
FROM producto p2
JOIN fabricante f ON p2.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo'
);

#1.1.7.8
#18
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo) = (
SELECT COUNT(p2.codigo)
FROM producto p2
JOIN fabricante f2 ON p2.codigo_fabricante = f2.codigo
WHERE f2.nombre = 'Lenovo'
);





































