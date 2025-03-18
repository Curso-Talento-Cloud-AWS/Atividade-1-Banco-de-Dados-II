/* Criar banco de dados de biblioteca */
create database if not exists biblioteca
default character set utf8mb4
default collate utf8mb4_general_ci;

use biblioteca;

/* Criar tabela de livros */
create table if not exists livros (
ID_LIVROS int auto_increment primary key,
TITULO varchar(50) not null,
AUTOR varchar(30) not null,
TIPO varchar(30) not null
) default charset = utf8mb4;

insert into livros values
(default, 'Harry Poter e a Pedra Filosofal', 'J. K. Rowling', 'Fantasia'),
(default, 'Percy Jackson O Ladrão de Raios', 'Rick Riordan', 'Fantasia'),
(default, 'Eu, Robo', 'Isaac Asimov', 'Ficção Cientifica'),
(default, 'Frankenstein', 'Mary Shelley', 'Ficção Cientifica'),
(default, 'A Culpa É das Estrelas', 'John Green', 'Romance'),
(default, 'A cinco passos de você', 'Rachael Lippincott', 'Romance'),
(default, 'Como eu era antes de você', 'Jojo Moyes', 'Romance');
select * from livros;

/* Criar tabela de clientes */
create table if not exists clientes (
NOME varchar(50) not null,
CPF varchar(25) not null primary key,
EMAIL varchar(30) not null,
ENDEREÇO varchar(35) not null,
LIVROS_ID int,
foreign key (LIVROS_ID) references livros (ID_LIVROS)
) default charset = utf8mb4;

insert into clientes values
('José Ramalho', '637.437.800-89', 'joseramalho75@gmail.com', 'Rua das Dores, 75 - Brasilia', 1),
('Ana Souza', '792.578.550-07', 'ana.souza@hotmail.com', 'Rua das Flores, 123 - SP', 5),
('Carlos Mendes', '258.159.770-47', 'carlos.mendes@gmail.com', 'Av. Paulista, 500 - SP', 7),
('Beatriz Oliveira', '698.764.490-01', 'beatriz.oli@gmail.com', 'Rua do Sol, 45 - RJ', NULL),
('Diego Martins', '573.632.530-64', 'diego.martins@hotmail.com', 'Av. Central, 789 - MG', 2),
('Fernanda Lima', '937.706.930-00', 'fernanda.lima@hotmail.com', 'Rua das Palmeiras, 210 - BA', 4),
('Gustavo Rocha', '769.233.240-17', 'gustavo.rocha@email.com', 'Praça Verde, 99 - RS', NULL);
select * from clientes;

/* INNER JOIN = Exibir o livro que cada cliente escolheu  */
select clientes.NOME, livros.TITULO 
from clientes inner join livros 
on livros.ID_LIVROS = clientes.LIVROS_ID;

/* LEFT JOIN = Exibir todos os clientes cadastrados indepedente se escolheu algum livro */
select clientes.NOME, livros.TITULO 
from clientes left join livros 
on livros.ID_LIVROS = clientes.LIVROS_ID;

/* RIGHT JOIN = Exibir todos os livros cadastrados indepedente se alguem o escolheu */
select clientes.NOME, livros.TITULO 
from clientes right join livros 
on livros.ID_LIVROS = clientes.LIVROS_ID;

/* UNION JOIN = Exibir todos os clientes e livros cadastrados */
select clientes.NOME, livros.TITULO 
from clientes left join livros 
on livros.ID_LIVROS = clientes.LIVROS_ID
union
select clientes.NOME, livros.TITULO 
from clientes right join livros 
on livros.ID_LIVROS = clientes.LIVROS_ID;
