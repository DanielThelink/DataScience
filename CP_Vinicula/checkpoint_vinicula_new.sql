-- drop database checkpoint_vinicola_bacos_new;
create database checkpoint_vinicola_bacos_new;
use checkpoint_vinicola_bacos_new;

CREATE TABLE vinho (
id integer primary key,
nome_vinho VARCHAR (40) NOT NULL,
classificacao_vinho VARCHAR (25),
tipo_uva VARCHAR(20),
valor_venda DECIMAL
);

CREATE TABLE cliente (
nome VARCHAR (20),
sobrenome VARCHAR (30),
sexo char,
cpf VARCHAR (11) primary key,
email VARCHAR (30) UNIQUE
);

CREATE TABLE notafiscal (
numero_nota VARCHAR (50) primary key,
cliente_comprador VARCHAR (11),
data_compra datetime,
valor_total decimal,
foreign key (cliente_comprador) references cliente (cpf)
);

CREATE TABLE pedido (
id integer primary key,
vinho_adquirido integer,
quantidade smallint,
valor_unitario decimal,
nf_pertencente VARCHAR (50), 
foreign key (vinho_adquirido) references vinho (id),
foreign key (nf_pertencente) references notafiscal (numero_nota)
);

-- area inserts
INSERT INTO `checkpoint_vinicola_bacos_new`.`cliente`
(`nome`,
`sobrenome`,
`sexo`,
`cpf`,
`email`)
VALUES ("Maria","Peixoto","F","12345678911","mariap@gmail.com"),
("Mario","fernandes","M","12345671234","mariopf@gmail.com");

INSERT INTO `checkpoint_vinicola_bacos_new`.`vinho`
(`id`,
`nome_vinho`,
`classificacao_vinho`,
`tipo_uva`,
`valor_venda`)

VALUES (1, "vinho 1", "seco","uva roxa", 2000),
(2, "vinho 2", "tinto","uva vermelha", 1000),
(3, "vinho 3", "suave","uva mole", 500);

INSERT INTO `checkpoint_vinicola_bacos_new`.`notafiscal`
(`numero_nota`,
`cliente_comprador`,
`data_compra`,
`valor_total`)

VALUES ("7869543332","12345678911","2022-01-20 12:00:00",2000),
("7869543231","12345671234","2022-02-20 13:00:00",1500);

INSERT INTO `checkpoint_vinicola_bacos_new`.`pedido`
(`id`,
`vinho_adquirido`,
`quantidade`,
`valor_unitario`,
`nf_pertencente`)

VALUES (1,1,1,2000,"7869543332"),(2,2,1,1000,"7869543231"),(3,3,1,500,"7869543231");


-- selects 
select * from cliente;
select * from vinho;
select * from notafiscal;
select * from pedido;


select * from notafiscal
inner join pedido on notafiscal.numero_nota = pedido.nf_pertencente
inner join vinho  on pedido.vinho_adquirido = vinho.id;

select notafiscal.numero_nota, avg(pedido.valor_unitario), sum(pedido.quantidade), sum(pedido.quantidade *pedido.valor_unitario) as "somadospedidos" from notafiscal
inner join pedido on notafiscal.numero_nota = pedido.nf_pertencente
inner join vinho  on pedido.vinho_adquirido = vinho.id
group by notafiscal.numero_nota;

