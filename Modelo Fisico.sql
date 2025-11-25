CREATE DATABASE construrunv1;

use construrunv1;

CREATE TABLE IF NOT EXISTS `Clientes` (
	`codigo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_cliente` varchar(80) NOT NULL,
	`cpf_cnpj_cliente` varchar(14) NOT NULL UNIQUE,
	`endereco` varchar(120) NOT NULL,
	`telefone` varchar(11) NOT NULL,
	`data_nascimento` date NOT NULL,
	PRIMARY KEY (`codigo`)
);

CREATE TABLE IF NOT EXISTS `Vendedor` (
	`matricula` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_vendedor` varchar(80) NOT NULL,
	PRIMARY KEY (`matricula`)
);

CREATE TABLE IF NOT EXISTS `Produtos` (
	`codigo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`descricao` varchar(80) NOT NULL,
	`valor` float NOT NULL,
	`custo` float NOT NULL,
	`quantidade` int NOT NULL,
	`fornecedor` int NOT NULL,
	PRIMARY KEY (`codigo`)
);

CREATE TABLE IF NOT EXISTS `Pedidos` (
	`numero` int AUTO_INCREMENT NOT NULL UNIQUE,
	`data_pedido` timestamp NOT NULL,
	`cliente` int NOT NULL,
	`vendedor` int NOT NULL,
	`tipo_pagamento` int NOT NULL,
	`status` varchar(20) NOT NULL,
	PRIMARY KEY (`numero`)
);

CREATE TABLE IF NOT EXISTS `Pagamento` (
	`id_pgto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`descricao` varchar(20) NOT NULL UNIQUE,
	`desconto` int NOT NULL,
	PRIMARY KEY (`id_pgto`)
);

CREATE TABLE IF NOT EXISTS `Fornecedor` (
	`codigo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`razao_social` varchar(80) NOT NULL,
	`cnpj_fornecedor` varchar(14) NOT NULL UNIQUE,
	PRIMARY KEY (`codigo`)
);

CREATE TABLE IF NOT EXISTS `Itens_Pedido` (
	`id_itens` int AUTO_INCREMENT NOT NULL UNIQUE,
	`numero_pedido` int NOT NULL,
	`codigo_produto` int NOT NULL,
	`quantidade` int NOT NULL,
	PRIMARY KEY (`id_itens`)
);

ALTER TABLE `Produtos` ADD CONSTRAINT `Produtos_fk5` FOREIGN KEY (`fornecedor`) REFERENCES `Fornecedor`(`codigo`);
ALTER TABLE `Pedidos` ADD CONSTRAINT `Pedidos_fk2` FOREIGN KEY (`cliente`) REFERENCES `Clientes`(`codigo`);
ALTER TABLE `Pedidos` ADD CONSTRAINT `Pedidos_fk3` FOREIGN KEY (`vendedor`) REFERENCES `Vendedor`(`matricula`);
ALTER TABLE `Pedidos` ADD CONSTRAINT `Pedidos_fk4` FOREIGN KEY (`tipo_pagamento`) REFERENCES `Pagamento`(`id_pgto`);
ALTER TABLE `Itens_Pedido` ADD CONSTRAINT `Itens_Pedido_fk1` FOREIGN KEY (`numero_pedido`) REFERENCES `Pedidos`(`numero`);
ALTER TABLE `Itens_Pedido` ADD CONSTRAINT `Itens_Pedido_fk2` FOREIGN KEY (`codigo_produto`) REFERENCES `Produtos`(`codigo`);