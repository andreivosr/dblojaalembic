CREATE DATABASE IF NOT EXISTS db_loja;
USE db_loja;

CREATE TABLE clientes (
    cli_codigo INT PRIMARY KEY AUTO_INCREMENT,
    cli_nome VARCHAR(100) NOT NULL,
    cli_email VARCHAR(100) UNIQUE NOT NULL,
    cli_senha_hash VARCHAR(150) NOT NULL,
    cli_criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
    cat_codigo INT PRIMARY KEY AUTO_INCREMENT,
    cat_nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
    pro_codigo INT PRIMARY KEY AUTO_INCREMENT,
    pro_cat_codigo INT NOT NULL,
    pro_nome VARCHAR(100) NOT NULL,
    pro_preco DECIMAL(10,2) NOT NULL,
    pro_estoque INT NOT NULL,
    FOREIGN KEY (pro_cat_codigo) REFERENCES categorias(cat_codigo)
);

CREATE TABLE pedidos (
    ped_codigo INT PRIMARY KEY AUTO_INCREMENT,
    ped_cli_codigo INT NOT NULL,
    ped_status VARCHAR(30) DEFAULT 'pendente',
    ped_total DECIMAL(10,2) NOT NULL,
    ped_datacriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ped_cli_codigo) REFERENCES clientes(cli_codigo)
);

CREATE TABLE itens_pedido (
    ipe_codigo INT PRIMARY KEY AUTO_INCREMENT,
    ipe_ped_codigo INT NOT NULL,
    ipe_pro_codigo INT NOT NULL,
    ipe_quantidade INT NOT NULL,
    ipe_preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ipe_ped_codigo) REFERENCES pedidos(ped_codigo),
    FOREIGN KEY (ipe_pro_codigo) REFERENCES produtos(pro_codigo)
);

select * from clientes;
select * from categorias

