  -- create database Urna_FIAP;
-- drop database urna_fiap;

CREATE TABLE Endereco (

id_endereco integer primary key NOT NULL AUTO_INCREMENT,
rua VARCHAR (40),
bairro VARCHAR (30),
numero VARCHAR (10),
cep VARCHAR (8),
cidade VARCHAR (20),
estado VARCHAR (2)

);

CREATE TABLE Usuario (

id_usuario integer primary key NOT NULL AUTO_INCREMENT,
cpf VARCHAR (11) unique,
nome VARCHAR (20),
sobrenome VARCHAR (30),
sexo ENUM('M','F','O'),
id_enderecoUsuario integer unique,

foreign key (id_enderecoUsuario) references Endereco(id_endereco)
);

CREATE TABLE Partido (

nome VARCHAR (20),
sigla VARCHAR (7) primary key,
legenda INT (2) unique,
descricao VARCHAR (40)

);


CREATE TABLE Candidato (

id_usuarioCandidato integer unique,
sigla_partido VARCHAR (7) unique,
numero_candidato int (4) primary key,

FOREIGN KEY (id_usuarioCandidato) references Usuario(id_usuario),	
FOREIGN KEY (sigla_partido) references Partido(sigla)

);

CREATE TABLE Local_Votacao(
ID integer primary key NOT NULL AUTO_INCREMENT,
local_voto VARCHAR (30),
rua VARCHAR (40), 
numero VARCHAR (10),
bairro VARCHAR (30)
);

CREATE TABLE Eleitor (

id_usuarioEleitor integer unique,
titulo_eleitor VARCHAR (12) primary key,
zona_votacao INT (3),
id_local_votacao integer unique,

FOREIGN KEY (id_usuarioEleitor) references Usuario(id_usuario),	
FOREIGN KEY (id_local_votacao) 	references Local_Votacao(ID)
);



CREATE TABLE Eleitor_Candidato (

numero_titulo VARCHAR (12),
candidato_votado int (4),
ano_eleicao year (4),

 
FOREIGN KEY (numero_titulo) references Eleitor(titulo_eleitor),
FOREIGN KEY (candidato_votado) references Candidato(numero_candidato),
PRIMARY KEY (numero_titulo, ano_eleicao)
);

CREATE TABLE Coligacao (

id_coligacao integer primary key NOT NULL AUTO_INCREMENT,
nome_coligacao VARCHAR (20) unique

);

CREATE TABLE Partido_Coligacao (

integrante_coligacao VARCHAR (7),
numero_coligacao integer ,

FOREIGN KEY (integrante_coligacao) references Partido(sigla),
FOREIGN KEY (numero_coligacao) references Coligacao(id_coligacao)

);


-- INSERÇAO DE DADOS NO BANCO 

INSERT INTO Endereco 
(
rua,
bairro,
numero,
cep,
cidade,
estado
)
VALUES ("Rua Augusto Correa Leite","Engenheiro Goulart","59","03726100","São Paulo","SP"),
(		"Rua dos professores","Engenheiro Goulart", "39","03725693","São Paulo","SP"),
(		"Rua dos parques","Tatuapé", "23","04225692","São Paulo","SP"),
(		"Rua dos cachorros","Barra da tijuca", "37","07725699","Rio de Janeiro","RJ"),
(		"Rua das tulipas","Copacabana", "40","08025690","Rio de Janeiro","RJ"),
(		"Rua dos tabajaras","Copacabana", "27","08025751","Rio de Janeiro","RJ"),
(		"Rua dos economistas","Boa vista", "45","08025467","Juiz de fora","MG"),
(		"Rua dos pastores","Bom pastor", "23","08025488","Juiz de fora","MG"),
(		"Rua da vaca","Bom pastor", "29","03625497","Juiz de fora","MG"),
(		"Rua das teixeiras","Teixeiras", "27","04525444","Juiz de fora","MG"),
(		"Rua dos principes","Tatuapé", "33","02525689","São Paulo","SP"),
(		"Rua das oliveiras","Pacaembu", "37","02525675","São Paulo","SP"),
(		"Rua do mestre","Morumbi", "40","02525633","São Paulo","SP"),
(		"Rua dos aprendizes","Brooklin", "12","03425612","São Paulo","SP"),
(		"Rua primeiro de março","Botafogo", "13","05625666","Rio de Janeiro","RJ"),
(		"Rua portugal","Benfica", "56","02425688","Rio de Janeiro","RJ"),
(		"Rua epitácio pessoa","Paquetá", "37","02525675","Rio de janeiro","RJ"),
(		"Rua presidente itamar franco","Bonfim", "678","02525787","Juiz de fora","MG"),
(		"Rua santos dummont","Marumbi", "567","02525878","Juiz de fora","MG"),
(		"Rua olegário maciel","Santa rita", "124","02525989","Juiz de fora","MG"),
(		"Rua josé romão guedes","Grajaú", "878","02525454","Juiz de fora","MG"),
(		"Rua 9 de julho","Barra funda", "432","02225788","São Paulo","SP"),
(		"Rua oscar freire","Itaim bibi", "465","02525233","São Paulo","SP"),
(		"Rua dos principes","Tatuapé", "33","02525689","São Paulo","SP"),
(		"Rua das tulipas","Copacabana", "40","08025690","Rio de Janeiro","RJ"),
(		"Rua das teixeiras","Teixeiras", "27","04525444","Juiz de fora","MG"),
(		"Rua dos aprendizes","Brooklin", "12","03425612","São Paulo","SP"),
(		"Rua dos economistas","Boa vista", "45","08025467","Juiz de fora","MG"),
(		"Rua santos dummont","Marumbi", "567","02525878","Juiz de fora","MG"),
(		"Rua dos principes","Tatuapé", "33","02525689","São Paulo","SP"),
(		"Rua das tulipas","Copacabana", "40","08025690","Rio de Janeiro","RJ"),
(		"Rua presidente itamar franco","Bonfim", "678","02525787","Juiz de fora","MG"),
(		"Rua dos aprendizes","Brooklin", "12","03425612","São Paulo","SP"),
(		"Rua dos parques","Tatuapé", "23","04225692","São Paulo","SP"),
(		"Rua dos professores","Engenheiro Goulart", "39","03725693","São Paulo","SP");


INSERT INTO Usuario 
(cpf,
nome,
sobrenome,
sexo,
id_enderecoUsuario
)

VALUES ("11111111111", "Daniel",	"Barros",	"M",1),
("22222222222",	"Matias",	"Herklotz",	"M",2),
("33333333333",	"Gustavo",	"Jordão",	"M",3),
("44444444444",	"Icaro",	"Fidalgo",	"M",4),
("55555555555",	"Mateus",	"Filho",	"M",5),
("66666666666",	"Debora",	"Faria",	"F",6),
("77777777777",	"Aline",	"Maia",		"F",7),
("88888888888",	"Joana",	"Darc",		"F",8),
("99999999999",	"Camila",	"Santos",	"F",9),
("11122233344",	"Miguel",	"Arcanjo",	"M",10),
("22233344455",	"Lucifer",	"Morningstar","M",11),
("10987654321",	"Kevin",	"Bueno",	"M",12),
("33344455566",	"Neymar",	"Junior",	"M",13),
("44455566677",	"Vinicius",	"Junior",	"M",14),
("55566677788",	"Lucas",	"Paqueta",	"M",15),
("66677788899",	"Marta",	"Silva",	"F",16),
("77788899910",	"Felipe",	"Scolari",	"M",17),
("88899910011",	"João",	     "Leite",	"M",18),
("99910011112",	"Weverton",	"Ribeiro",	"M",19),
("10011012134",	"Rony",		"Rustico",	"M",20),
("11112133145",	"Leticia",	"Crozarol",	"F",21),
("12131415167",	"Fatima",	"Bernardes","F",22),
("13141516178",	"Hugo",		"Maia",		"M",23),
("14151617189",	"Valfredo",	"Faria",    "F",24),
("15161718192",	"Leoncio",	"Santos",   "M",25),
("16171819203",	"Maria",	"Aparecida","F",26),
("17181920212",	"Leonidas",	"Spinozza","M",27),
("18192021223",	"Johnny",	"Bravo",	"M",28),
("19202122234",	"Hilda",	"Conceição","F",29),
("21222324256",	"Ernesto",	"Augusto",  "M",30),
("22232425267",	"Ronaldo",	"Assis",	"M",31),
("23242526278",	"Hinacio",	"Silva",	"M",32),
("24252627289",	"Frederico","Valverde",	"M",33),
("25262728290",	"Carlos",	"Souza",	"M",34),
("26272829301",	"Manuel",	"Fernandes","M",35);


insert into Partido
(
nome,
sigla,
legenda,
descricao
)

values ("partido amarelo","PA",10,"partido amarelo é legal"),
("partido vermelho","PV",11,"partido vermelho é legal"),
("partido azul","PAZ",12,"partido azul é legal"),
("partido majenta","PM",13,"partido majenta é legal"),
("partido rosa","PR",14,"partido rosa é legal"),
("partido roxo","PROX",15,"partido roxo é legal"),
("partido preto","PT",16,"partido preto é legal"),
("partido cinza","PC",17,"partido cinza é legal"),
("partido branco","PB",18,"partido branco é legal"),
("partido ouro","PO",19,"partido ouro é legal"),
("partido prata","PP",20,"partido prata é legal"),
("partido diamante","PD",21,"partido diamante é legal"),
("partido verde","PVER",22,"partido verde é legal"),
("partido violeta","PVIO",23,"partido diamante é legal");

INSERT INTO Candidato(

id_usuarioCandidato,
sigla_partido,
numero_candidato
)

VALUES (31,"PA",1122),
(32,"PV",2233),
(33,"PAZ",3344),
(34,"PM",4455),
(35,"PR",5566);


INSERT INTO Local_votacao(

local_voto,
rua, 
numero,
bairro

)

VALUES ("Colegio Machado de Assis","Rua dos professores","45","Engenheiro Goulart"),
("Colegio Machado de Assis","Rua dos professores","45","Engenheiro Goulart"),
("Colegio Joaquim ","Rua das flores","37","Tatuapé"),
("Colegio Maria ","Rua dos gatos","25","Barra da tijuca"),
("Colegio Machado ","Rua das rosas","23","Copacabana"),
("Colegio Machado ","Rua das rosas","23","Copacabana"),
("Colegio Assis ","Rua dos falidos","27","Boa Vista"),
("Colegio Ribeiro ","Rua das ovelhas","28","Bom Pastor"),
("Colegio Castro ","Rua do boi","29","Bom Pastor"),
("Colegio Cangaiba ","Rua dos tuxeras","31","Teixeiras"),
("Colegio Itaim ","Rua dos plebeus","32","Tatuapé"),
("Colegio Barros ","Rua das maças","33","Pacaembu"),
("Colegio Faria ","Rua do servo","34","Morumbi"),
("Colegio Augusto ","Rua dos especialistas","35","Brooklin"),
("Colegio Pinto ","Rua segundo de março","36","Botafogo"),
("Colegio Jordão ","Rua espanha","37","Benfica"),
("Colegio Santos ","Rua mary pessoa","38","Paquetá"),
("Colegio Herklotz ","Rua fernando collor","39","Bonfim"),
("Colegio Cornelsen ","Rua irmaos wright","40","Marumbi"),
("Colegio Icaro ","Rua maciel","41","Santa Rita"),
("Colegio Cesar ","Rua romão","42","Grajaú"),
("Colegio Eduardo ","Rua 10 de julho","43","Barra Funda"),
("Colegio Mateus ","Rua oscar niemeyer","44","Itaim bibi"),
("Colegio Itaim ","Rua dos plebeus","32","Tatuapé"),
("Colegio Machado ","Rua das rosas","23","Copacabana"),
("Colegio Cangaiba ","Rua dos tuxeras","31","Teixeiras"),
("Colegio Augusto ","Rua dos especialistas","35","Brooklin"),
("Colegio Assis ","Rua dos falidos","27","Boa Vista"),
("Colegio Cornelsen ","Rua irmaos wright","40","Marumbi"),
("Colegio Itaim ","Rua dos plebeus","32","Tatuapé"),
("Colegio Machado ","Rua das rosas","23","Copacabana"),
("Colegio Herklotz ","Rua fernando collor","39","Bonfim"),
("Colegio Augusto ","Rua dos especialistas","35","Brooklin"),
("Colegio Joaquim ","Rua das flores","37","Tatuapé"),
("Colegio Machado de Assis","Rua dos professores","45","Engenheiro Goulart");

insert into Eleitor
(
id_usuarioEleitor,
titulo_eleitor,
zona_votacao,
id_local_votacao
)
		  
VALUES (1,"111111111111",111,1),
       (2,"222222222222",222,2),
(3,"333333333333",333,3),
(4,"444444444444",444,4),
(5,"555555555555",555,5),
(6,"666666666666",666,6),
(7,"777777777777",777,7),
(8,"888888888888",888,8),
(9,"999999999999",999,9),
(10,"123456789104",123,10),
(11,"121314151617",167,11),
(12,"131415161718",178,12),
(13,"151617181920",192,13),
(14,"161718192122",192,14),
(15,"171819202324",212,15),
(16,"181920212526",223,16),
(17,"192021222728",234,17),
(18,"202122232930",245,18),
(19,"212223243132",256,19),
(20,"222324253334",267,20),
(21,"232425263536",278,21),
(22,"272829303738",312,22),
(23,"282930313233",345,23),
(24,"293031323334",356,24),
(25,"303132333435",367,25),
(26,"313233343536",378,26),
(27,"323334353637",389,27),
(28,"333435363738",391,28),
(29,"343536373839",401,29),
(30,"353637383940",412,30),
(31,"363738394041",423,31),
(32,"373839404142",434,32),
(33,"383940414243",445,33),
(34,"394041424344",456,34),
(35,"404142434445",467,35);

INSERT INTO eleitor_candidato
(
numero_titulo,
candidato_votado,
ano_eleicao
)

VALUES ("111111111111",1122,2022),
("222222222222",2233,2022),
("333333333333",3344,2022),
("444444444444",4455,2022),
("555555555555",5566,2022),
("666666666666",1122,2022),
("777777777777",1122,2022),
("888888888888",3344,2022),
("999999999999",3344,2022),
("123456789104",3344,2022),
("121314151617",2233,2022),
("131415161718",2233,2022),
("151617181920",2233,2022),
("161718192122",4455,2022),
("171819202324",2233,2022),
("181920212526",4455,2022),
("192021222728",4455,2022),
("202122232930",5566,2022),
("212223243132",5566,2022),
("222324253334",5566,2022),
("232425263536",5566,2022),
("272829303738",5566,2022),
("282930313233",1122,2022),
("293031323334",1122,2022),
("303132333435",1122,2022),
("313233343536",1122,2022),
("323334353637",3344,2022),
("333435363738",3344,2022),
("343536373839",3344,2022),
("353637383940",3344,2022),
("363738394041",2233,2022),
("373839404142",2233,2022),
("383940414243",2233,2022),
("394041424344",2233,2022),
("404142434445",5566,2022);

INSERT INTO Coligacao(

nome_coligacao
)

VALUES ("Coligacao PA"),
("Coligacao PV"),
("Coligacao PAZ"),
("Coligacao PM"),
("Coligacao PR");

insert into Partido_Coligacao(

integrante_coligacao,
numero_coligacao

)

values ("PA",1),
("PROX",1),
("PT",1),
("PC",1),
("PV",2),
("PB",2),
("PO",2),
("PP",2),
("PAZ",3),
("PD",3),
("PM",4),
("PVER",4),
("PR",5),
("PVIO",5);

-- CONSULTAS

-- Liste as coligações (quais outros partidos são aliados) de um partido:

select * from Partido_Coligacao ORDER BY numero_coligacao;

-- Deixei mais bonito a consulta numero 1 aqui:

select integrante_coligacao as "Integrante Coligação", nome_coligacao as "Nome Coligação",numero_coligacao as "ID Coligacão"
FROM Partido_Coligacao
INNER JOIN coligacao
on numero_coligacao = id_coligacao
ORDER BY numero_coligacao;

-- Gere uma consulta que retorne o número de votos para cada candidato

SELECT candidato_votado AS "Numero do Candidato",
     COUNT(candidato_votado) AS "Votos por candidato"
FROM eleitor_candidato
GROUP BY candidato_votado
ORDER BY COUNT(*) DESC;

-- Liste os candidatos de cada partido em uma única consulta, apresentando nome e sobrenome do candidato, número de votação, legenda e sigla do partido

SELECT Usuario.Nome, Usuario.sobrenome, candidato.numero_candidato as "Numero do candidato",partido.legenda as "Legenda do Partido",partido.sigla as "Sigla do Partido"
FROM Usuario
INNER JOIN candidato
on usuario.id_usuario = candidato.id_usuarioCandidato
INNER JOIN partido
on candidato.sigla_partido = partido.sigla;

-- Gere uma consulta que retorne o número de votos, por partido, por cidade do eleitor

Select COUNT(eleitor_candidato.candidato_votado) as "Numero Votos" , candidato.sigla_partido as "Partido", endereco.cidade
FROM Endereco
INNER JOIN Usuario
on Endereco.id_endereco = Usuario.id_enderecoUsuario
INNER JOIN eleitor
on Usuario.id_usuario = eleitor.id_usuarioEleitor
INNER JOIN eleitor_candidato
on eleitor.titulo_eleitor = eleitor_candidato.numero_titulo
INNER JOIN Candidato
on eleitor_candidato.candidato_votado = Candidato.numero_candidato
group by partido, cidade;