-- Dump para CineCampus

DROP DATABASE IF EXISTS cinecampus;
CREATE DATABASE cinecampus;
USE cinecampus;

-- Tabla de paises
CREATE TABLE paises (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de generos
CREATE TABLE generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de formatos
CREATE TABLE formatos (
    id_formato INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE -- Ej: Digital, Físico, 35mm, Blu-ray
);

-- Tabla de peliculas
CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    duracion INT NOT NULL, -- minutos
    sinopsis TEXT,
    anio_estreno YEAR,
    id_pais INT,
    id_genero INT,
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais),
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);

-- Tabla intermedia pelicula_formato (muchos a muchos)
CREATE TABLE pelicula_formato (
    id_pelicula INT,
    id_formato INT,
    PRIMARY KEY (id_pelicula, id_formato),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_formato) REFERENCES formatos(id_formato)
);

-- Tabla de interpretes
CREATE TABLE interpretes (
    id_interprete INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE
);

-- Tabla intermedia pelicula_interprete (muchos a muchos con tipo de papel)
CREATE TABLE pelicula_interprete (
    id_pelicula INT,
    id_interprete INT,
    tipo_papel VARCHAR(50), -- Ej: Protagonista, Secundario, Extra
    PRIMARY KEY (id_pelicula, id_interprete),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_interprete) REFERENCES interpretes(id_interprete)
);
