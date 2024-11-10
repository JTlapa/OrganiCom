-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS OrganiCom;
USE OrganiCom;

-- Crear tabla Usuario
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasenia VARCHAR(255) NOT NULL
);

-- Crear tabla Vendedor
CREATE TABLE Vendedor (
    idUsuario INT PRIMARY KEY,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Crear tabla Cliente
CREATE TABLE Cliente (
    idUsuario INT PRIMARY KEY,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Crear tabla Producto
CREATE TABLE Producto (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    idVendedor INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precioUSD DECIMAL(10, 2) NOT NULL,
    precioMXM DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    imagen VARCHAR(100) NOT NULL,
    FOREIGN KEY (idVendedor) REFERENCES Vendedor(idUsuario)
);

-- Crear tabla Carrito
CREATE TABLE Carrito (
    idCarrito INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    estatus VARCHAR(20),
    FOREIGN KEY (idUsuario) REFERENCES Cliente(idUsuario)
);

-- Crear tabla ProductoComprado
CREATE TABLE ProductoComprado (
    idCarrito INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT,
    FOREIGN KEY (idCarrito) REFERENCES Carrito(idCarrito),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Mensaje final
SELECT 'Base de datos OrganiCom creada exitosamente.' AS mensaje;
