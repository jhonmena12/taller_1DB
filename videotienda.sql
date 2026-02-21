
IF DB_ID('VideoTienda') IS NOT NULL
    DROP DATABASE VideoTienda;
GO

CREATE DATABASE VideoTienda;
GO

USE VideoTienda;
GO



CREATE TABLE Clientes (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(150),
    CorreoElectronico VARCHAR(100)
);
GO



CREATE TABLE Formato (
    IdFormato INT IDENTITY(1,1) PRIMARY KEY,
    TipoFormato VARCHAR(50) NOT NULL,
    ValorAlquiler DECIMAL(10,2) NOT NULL
);
GO



CREATE TABLE Director (
    IdDirector INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50)
);
GO



CREATE TABLE Actor (
    IdActor INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);
GO



CREATE TABLE Genero (
    IdGenero INT IDENTITY(1,1) PRIMARY KEY,
    NombreGenero VARCHAR(50) NOT NULL
);
GO



CREATE TABLE Video (
    Codigo INT PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    Idioma VARCHAR(50),
    Duracion INT,
    IdFormato INT NOT NULL,
    IdDirector INT NOT NULL,
    CONSTRAINT FK_Video_Formato 
        FOREIGN KEY (IdFormato) REFERENCES Formato(IdFormato),
    CONSTRAINT FK_Video_Director 
        FOREIGN KEY (IdDirector) REFERENCES Director(IdDirector)
);
GO



CREATE TABLE Alquiler (
    IdAlquiler INT IDENTITY(1,1) PRIMARY KEY,
    FechaAlquiler DATE NOT NULL,
    FechaDevolucion DATE,
    DiasRetraso INT DEFAULT 0,
    CodigoCliente INT NOT NULL,
    CONSTRAINT FK_Alquiler_Cliente 
        FOREIGN KEY (CodigoCliente) REFERENCES Clientes(Codigo)
);
GO




CREATE TABLE VideoGenero (
    CodigoVideo INT NOT NULL,
    IdGenero INT NOT NULL,
    PRIMARY KEY (CodigoVideo, IdGenero),
    CONSTRAINT FK_VideoGenero_Video 
        FOREIGN KEY (CodigoVideo) REFERENCES Video(Codigo),
    CONSTRAINT FK_VideoGenero_Genero 
        FOREIGN KEY (IdGenero) REFERENCES Genero(IdGenero)
);
GO


CREATE TABLE VideoActor (
    CodigoVideo INT NOT NULL,
    IdActor INT NOT NULL,
    PRIMARY KEY (CodigoVideo, IdActor),
    CONSTRAINT FK_VideoActor_Video 
        FOREIGN KEY (CodigoVideo) REFERENCES Video(Codigo),
    CONSTRAINT FK_VideoActor_Actor 
        FOREIGN KEY (IdActor) REFERENCES Actor(IdActor)
);
GO


CREATE TABLE DetalleAlquiler (
    IdAlquiler INT NOT NULL,
    CodigoVideo INT NOT NULL,
    PRIMARY KEY (IdAlquiler, CodigoVideo),
    CONSTRAINT FK_DetalleAlquiler_Alquiler 
        FOREIGN KEY (IdAlquiler) REFERENCES Alquiler(IdAlquiler),
    CONSTRAINT FK_DetalleAlquiler_Video 
        FOREIGN KEY (CodigoVideo) REFERENCES Video(Codigo)
);
GO