-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS menu_pedidos_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE menu_pedidos_db;

-- Tabla de menús
CREATE TABLE IF NOT EXISTS menus (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL
);

-- Tabla de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cliente_nombre VARCHAR(100) NOT NULL,
    fecha_pedido DATE NOT NULL,
    menu_id BIGINT,
    cantidad INT NOT NULL,
    FOREIGN KEY (menu_id) REFERENCES menus(id)
);

-- Datos de prueba para menus
INSERT INTO menus (nombre, descripcion, precio) VALUES
('Desayuno Ejecutivo', 'Huevos, pan, jugo natural', 3.50),
('Almuerzo Vegetariano', 'Arroz integral, vegetales salteados, ensalada', 4.25),
('Almuerzo Ejecutivo', 'Carne o pollo, arroz, ensalada y bebida', 5.00);

-- Datos de prueba para pedidos
INSERT INTO pedidos (cliente_nombre, fecha_pedido, menu_id, cantidad) VALUES
('Empresa ABC', CURDATE(), 1, 15),
('Empresa XYZ', CURDATE(), 2, 20);
