DROP SCHEMA IF EXISTS tp CASCADE;
CREATE SCHEMA tp;

CREATE TYPE PAIS AS ENUM ('Argentina', 'Chile', 'Paraguay', 'Bolivia', 'Peru', 'Uruguay');
CREATE TYPE ESTADO_AMISTAD AS ENUM ('pendiente', 'aceptada', 'bloqueada');
CREATE TYPE ROL_USUARIO AS ENUM ('administrador', 'miembro');

CREATE TABLE Usuarios (
    id_usuario INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    fecha_ingreso DATE NOT NULL DEFAULT CURRENT_DATE,
    cantidad_ingresos INT DEFAULT 0,
    pais PAIS NOT NULL,
    fecha_eliminacion TIMESTAMP,
    CONSTRAINT chk_email CHECK (email LIKE '%@gmail.com')
);

CREATE TABLE Grupos (
    id_grupo INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_eliminacion TIMESTAMP
);

CREATE TABLE Publicaciones (
    id_publicacion INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    media_url VARCHAR(500),
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_eliminacion TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE Notificaciones (
    id_notificacion INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_receptor INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    leida BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_emision TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_receptor) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE Mensajes (
    id_mensaje INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_emisor INT NOT NULL,
    id_receptor INT NOT NULL,
    contenido VARCHAR(255) NOT NULL,
    fecha_envio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_lectura TIMESTAMP,
    fecha_eliminacion TIMESTAMP,
    FOREIGN KEY (id_emisor) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_receptor) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    CHECK (id_emisor != id_receptor)
);

CREATE TABLE Amistades (
    id_usuario_1 INT NOT NULL,
    id_usuario_2 INT NOT NULL,
    fecha_solicitud TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado ESTADO_AMISTAD NOT NULL DEFAULT 'pendiente',
    PRIMARY KEY (id_usuario_1, id_usuario_2),
    FOREIGN KEY (id_usuario_1) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario_2) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    CHECK (id_usuario_1 < id_usuario_2)
);

CREATE TABLE Usuarios_Grupos (
    id_usuario INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha_ingreso TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    rol_usuario ROL_USUARIO NOT NULL DEFAULT 'miembro',
    PRIMARY KEY (id_usuario, id_grupo),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_grupo) REFERENCES Grupos (id_grupo) ON DELETE CASCADE
);

CREATE TABLE Publicaciones_Grupos (
    id_publicacion INT NOT NULL,
    id_grupo INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_grupo),
    FOREIGN KEY (id_publicacion) REFERENCES Publicaciones(id_publicacion) ON DELETE CASCADE,
    FOREIGN KEY (id_grupo) REFERENCES Grupos(id_grupo) ON DELETE CASCADE
);

CREATE TABLE Usuarios_Publicaciones_Favoritas (
    id_usuario INT NOT NULL,
    id_publicacion INT NOT NULL,
    fecha_favorito TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario, id_publicacion),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_publicacion) REFERENCES Publicaciones(id_publicacion) ON DELETE CASCADE
);