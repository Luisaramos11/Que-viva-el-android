CREATE DATABASE Consulta;
USE Consulta;

CREATE TABLE Fabricantes(
codigo int PRIMARY KEY auto_increment,
nombre varchar (100));

CREATE TABLE Productos(
codigo int PRIMARY KEY auto_increment,
nombre varchar (100),
precio double,
codigo_fabricante int);

ALTER TABLE Productos
ADD CONSTRAINT FK_Fabricantes_Productos
FOREIGN KEY (codigo_fabricante) REFERENCES Fabricantes (codigo);
