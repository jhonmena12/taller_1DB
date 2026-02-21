CREATE DATABASE CooperativaPrestamos;
GO

USE CooperativaPrestamos;
GO

CREATE TABLE Empresa (
    IdEmpresa INT PRIMARY KEY IDENTITY(1,1),
    NombreEmpresa VARCHAR(100) NOT NULL,
    NitEmpresa VARCHAR(20) NOT NULL UNIQUE
);
GO

CREATE TABLE Socio (
    IdSocio INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(150),
    IdEmpresa INT NOT NULL,
    FOREIGN KEY (IdEmpresa) REFERENCES Empresa(IdEmpresa)
);
GO

CREATE TABLE ModalidadPrestamo (
    IdModalidad INT PRIMARY KEY IDENTITY(1,1),
    TipoModalidad VARCHAR(50) NOT NULL,
    PlazoMaximo INT NOT NULL,
    TasaInteres DECIMAL(5,2) NOT NULL
);
GO

CREATE TABLE Prestamo (
    NumeroPrestamo INT PRIMARY KEY IDENTITY(1,1),
    IdSocio INT NOT NULL,
    IdModalidad INT NOT NULL,
    PlazoMeses INT NOT NULL,
    CuotaMensual DECIMAL(12,2) NOT NULL,
    ValorPrestamo DECIMAL(12,2) NOT NULL,
    FechaInicio DATE NOT NULL,
    FOREIGN KEY (IdSocio) REFERENCES Socio(IdSocio),
    FOREIGN KEY (IdModalidad) REFERENCES ModalidadPrestamo(IdModalidad)
);
GO

CREATE TABLE Codeudor (
    IdCodeudor INT PRIMARY KEY IDENTITY(1,1),
    NumeroPrestamo INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Salario DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (NumeroPrestamo) REFERENCES Prestamo(NumeroPrestamo)
);
GO