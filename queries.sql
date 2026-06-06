-- 1. Listar los amigos confirmados de un usuario particular (Ejemplo: id = 10)
SELECT u.id_usuario, u.nombre, u.apellido
FROM Amistades a
JOIN Usuarios u ON a.id_usuario_2 = u.id_usuario
WHERE a.id_usuario_1 = 10 AND a.estado = 'aceptada'
UNION
SELECT u.id_usuario, u.nombre, u.apellido
FROM Amistades a
JOIN Usuarios u ON a.id_usuario_1 = u.id_usuario
WHERE a.id_usuario_2 = 10 AND a.estado = 'aceptada'
ORDER BY nombre, apellido;

-- 2. Contabilizar la cantidad de usuarios activos, agrupados por país
SELECT pais, COUNT(*) AS cantidad_usuarios
FROM Usuarios
WHERE fecha_eliminacion IS NULL
GROUP BY pais
ORDER BY cantidad_usuarios DESC;

-- 3. Mostrar las publicaciones más populares ordenadas por cantidad de favoritos
SELECT p.id_publicacion, p.descripcion, p.tipo, p.fecha_creacion,
       u.nombre || ' ' || u.apellido AS autor,
       COUNT(upf.id_publicacion) AS cantidad_favoritos
FROM Publicaciones p
JOIN Usuarios u ON p.id_usuario = u.id_usuario
LEFT JOIN Usuarios_Publicaciones_Favoritas upf ON p.id_publicacion = upf.id_publicacion
WHERE p.fecha_eliminacion IS NULL 
GROUP BY p.id_publicacion, p.descripcion, p.tipo, p.fecha_creacion, u.nombre, u.apellido
ORDER BY cantidad_favoritos DESC;

-- 4. Mostrar los usuarios más populares basándose en la cantidad total de favoritos que recibieron
WITH publicaciones_favoritas AS (
    SELECT id_publicacion, COUNT(*) AS cantidad
    FROM Usuarios_Publicaciones_Favoritas
    GROUP BY id_publicacion
)
SELECT u.id_usuario, u.nombre, u.apellido, SUM(pf.cantidad) AS total_favoritos_recibidos
FROM Usuarios u
JOIN Publicaciones p ON u.id_usuario = p.id_usuario
JOIN publicaciones_favoritas pf ON p.id_publicacion = pf.id_publicacion
WHERE u.fecha_eliminacion IS NULL
GROUP BY u.id_usuario, u.nombre, u.apellido
ORDER BY total_favoritos_recibidos DESC;