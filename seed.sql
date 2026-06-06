TRUNCATE TABLE Usuarios CASCADE;

INSERT INTO Usuarios (nombre, apellido, email, password_hash, fecha_ingreso, cantidad_ingresos, pais) VALUES
('Joani', 'Pranteda', 'joani_pranteda@gmail.com', 'pbkdf2_sha256$216000$dummyhash1', '2023-03-15', 25, 'Argentina'), 
('Daira', 'Gomez', 'daira_gomez@gmail.com', 'pbkdf2_sha256$216000$dummyhash2', '2023-05-10', 15, 'Argentina'), 
('Naomy', 'Lopez', 'naomy_lopez@gmail.com', 'pbkdf2_sha256$216000$dummyhash3', '2022-11-20', 40, 'Chile'), 
('Lucas', 'Martinez', 'lucas_martinez@gmail.com', 'pbkdf2_sha256$216000$dummyhash4', '2024-01-05', 8, 'Uruguay'), 
('Sofia', 'Perez', 'sofia_perez@gmail.com', 'pbkdf2_sha256$216000$dummyhash5', '2024-07-02', 5, 'Argentina'), 
('Diego', 'Gomez Perci', 'diego_gomezperci@gmail.com', 'pbkdf2_sha256$216000$dummyhash6', '2022-09-13', 60, 'Argentina'), 
('Camila', 'Fernandez', 'camila_fernandez@gmail.com', 'pbkdf2_sha256$216000$dummyhash7', '2023-10-01', 12, 'Paraguay'), 
('Mateo', 'Sanchez', 'mateo_sanchez@gmail.com', 'pbkdf2_sha256$216000$dummyhash8', '2024-03-18', 10, 'Bolivia'), 
('Valentina', 'Suarez', 'valentina_suarez@gmail.com', 'pbkdf2_sha256$216000$dummyhash9', '2023-12-28', 22, 'Peru'), 
('Martina', 'Rossi', 'martina_rossi@gmail.com', 'pbkdf2_sha256$216000$dummyhash10', '2022-06-19', 33, 'Argentina');

INSERT INTO Grupos (nombre, descripcion, fecha_creacion) VALUES
('Programadores Java', 'Grupo dedicado al intercambio de conocimientos sobre Java', '2023-04-12'), 
('Cafe y Charlas', 'Un espacio para conversar sobre cualquier tema con buena compania', '2023-09-02'), 
('Modelacion Numerica', 'Estudiantes y docentes compartiendo ejercicios y tips', '2024-03-06'), 
('Gamers', 'Comunidad para organizar partidas online y hablar de videojuegos', '2023-10-15'), 
('Musica y Produccion', 'Intercambio de ideas y recursos sobre produccion musical', '2023-07-20');

INSERT INTO Publicaciones (tipo, fecha_creacion, descripcion, id_usuario, media_url) VALUES
('Texto', '2023-06-01 09:15:00', 'Reflexion matutina', 1, NULL), 
('Texto', '2023-09-02 08:45:00', 'Pensamiento del dia', 3, NULL), 
('Texto', '2024-02-10 11:30:00', 'Motivacion del dia', 4, NULL), 
('Texto', '2024-04-01 18:00:00', 'Inspiracion musical', 9, NULL), 
('Texto', '2024-07-25 22:15:00', 'Cierre de jornada', 10, NULL), 
('Imagen', '2023-09-02 09:30:00', 'Foto del grupo en el cafe', 2, 'https://s3.amazonaws.com/bucket/img1.jpg'), 
('Imagen', '2024-03-06 14:10:00', 'Grafico del proyecto final', 3, 'https://s3.amazonaws.com/bucket/img2.jpg'), 
('Video', '2023-07-20 13:00:00', 'Demo de nueva cancion', 7, 'https://s3.amazonaws.com/bucket/vid1.mp4');

INSERT INTO Notificaciones (tipo, fecha_emision, descripcion, id_receptor, leida) VALUES
('Solicitud de amistad', '2023-06-10 10:15:00', 'Daira te ha enviado una solicitud de amistad.', 1, false), 
('Publicacion en grupo', '2023-09-01 08:30:00', 'Nueva publicacion en el grupo "Cafe y Charlas".', 1, false), 
('Publicacion de amigo', '2023-07-21 14:45:00', 'Tu amiga Naomy ha compartido una nueva publicacion.', 1, false), 
('Publicacion en grupo', '2023-10-05 09:00:00', 'Nueva publicacion en el grupo "Modelacion Numerica".', 9, false), 
('Solicitud de amistad', '2024-01-14 18:00:00', 'Lucas te ha enviado una solicitud de amistad.', 7, false), 
('Solicitud de amistad', '2024-04-09 16:20:00', 'Sofia te ha enviado una solicitud de amistad.', 6, false);

INSERT INTO Mensajes (contenido, fecha_envio, fecha_lectura, id_emisor, id_receptor) VALUES
('Hola Daira, como estas?', '2023-06-10 10:00:00', '2023-06-10 10:05:00', 1, 2), 
('Todo bien Joani, vos?', '2023-06-10 10:06:00', '2023-06-10 10:07:00', 2, 1), 
('Te pase el codigo del ejercicio de LU', '2023-07-21 15:10:00', '2023-07-21 15:20:00', 3, 1), 
('Nos juntamos a estudiar?', '2023-07-21 16:00:00', '2024-03-07 16:10:00', 1, 3), 
('Jugamos esta noche?', '2024-07-10 18:00:00', '2024-07-10 18:10:00', 4, 5), 
('Dale, me conecto a las 22', '2024-07-10 18:20:00', NULL, 5, 4), 
('Che Diego, te debo algo?', '2023-11-01 11:00:00', '2023-11-01 11:05:00', 1, 6), 
('No, al contrario, yo te debo a vos jajaja', '2023-11-02 11:10:00', NULL, 6, 1);

INSERT INTO Usuarios_Grupos (id_usuario, id_grupo, fecha_ingreso, rol_usuario) VALUES
(1, 1, '2023-04-12', 'administrador'), 
(1, 2, '2023-09-01', 'miembro'), 
(2, 2, '2023-09-02', 'administrador'), 
(3, 3, '2024-03-06', 'administrador'), 
(4, 4, '2023-10-15', 'administrador'), 
(5, 4, '2023-10-16', 'miembro'), 
(6, 1, '2023-04-13', 'miembro'), 
(7, 5, '2023-07-20', 'administrador'), 
(8, 5, '2023-08-01', 'miembro'), 
(9, 3, '2024-03-07', 'miembro'), 
(10, 2, '2023-09-03', 'miembro');

INSERT INTO Amistades (id_usuario_1, id_usuario_2, fecha_solicitud, estado) VALUES
(1, 2, '2023-06-10', 'aceptada'), 
(1, 3, '2023-07-21', 'aceptada'), 
(1, 4, '2024-02-01', 'aceptada'), 
(2, 5, '2023-10-10', 'aceptada'), 
(3, 6, '2022-12-05', 'aceptada'), 
(4, 7, '2024-01-14', 'aceptada'), 
(5, 8, '2024-03-30', 'aceptada'), 
(6, 9, '2023-05-22', 'aceptada'), 
(7, 10, '2023-12-12', 'aceptada'), 
(9, 10, '2024-05-02', 'aceptada');

INSERT INTO Publicaciones_Grupos (id_publicacion, id_grupo) VALUES
(2, 3), 
(3, 4), 
(4, 3), 
(5, 2), 
(6, 2), 
(7, 3), 
(8, 5);

INSERT INTO Usuarios_Publicaciones_Favoritas (id_usuario, id_publicacion, fecha_favorito) VALUES
(1, 2, '2023-09-03 11:00:00'), 
(1, 5, '2024-07-26 13:15:00'), 
(2, 1, '2023-06-02 10:30:00'), 
(3, 3, '2024-03-10 09:00:00'), 
(4, 4, '2024-04-02 20:10:00'), 
(5, 2, '2023-09-05 15:00:00'), 
(6, 1, '2023-06-02 08:00:00'), 
(7, 5, '2024-07-26 14:30:00'), 
(8, 6, '2024-03-08 16:45:00'), 
(9, 7, '2024-05-03 11:10:00'), 
(10, 3, '2024-03-12 09:20:00');