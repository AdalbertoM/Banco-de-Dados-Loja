CREATE TABLE pessoa(
	codp serial NOT NULL,
	login varchar(50) NOT NULL,
	senha varchar(50) NOT NULL,
	nome varchar(100) NOT NULL,
	tipop BOOLEAN NOT NULL,
	doc varchar NOT NULL,
	docest integer NOT NULL,
	tel varchar NOT NULL,
	email varchar(70) NOT NULL,
	tipo varchar(30) NOT NULL,
	logradouro varchar(50) NOT NULL,
	num integer NOT NULL,
	complemento varchar(150) NOT NULL,
	bairro varchar(30) NOT NULL,
	cidade varchar(30) NOT NULL,
	CONSTRAINT pk_pessoa PRIMARY KEY (codp)
);
--
CREATE TABLE produto(
	codpro serial NOT NULL,
	descricao varchar(50) NOT NULL,
	valor FLOAT NOT NULL,
	CONSTRAINT pk_produto PRIMARY KEY (codpro)
);
--
CREATE TABLE venda(
	codv serial NOT NULL,
	descr varchar(50) NOT NULL,
	valor FLOAT(50) NOT NULL,
	valordesc FLOAT(50) NULL,
	codp integer NOT NULL,
	CONSTRAINT pk_venda PRIMARY KEY (codv),
    CONSTRAINT fk_venda_pessoa FOREIGN KEY (codp) REFERENCES pessoa(codp)
);
--
CREATE TABLE vendapp(
	codpro integer NOT NULL,
	codv integer NOT NULL,
	quant integer NOT NULL,
    CONSTRAINT fk_vendapp_produto FOREIGN KEY (codpro) REFERENCES produto(codpro),
    CONSTRAINT fk_vendapp_venda FOREIGN KEY (codv) REFERENCES venda(codv)
);
--
CREATE TABLE compra(
	codc serial NOT NULL,
	descr varchar(50) NOT NULL,
	valor FLOAT(50) NOT NULL,
	valordesc FLOAT(50) NULL,
	codp integer NOT NULL,
	CONSTRAINT pk_compra PRIMARY KEY (codc),
    CONSTRAINT fk_compra_pessoa FOREIGN KEY (codp) REFERENCES pessoa(codp)
);
--
CREATE TABLE comprapp(
	codpro integer NOT NULL,
	codc integer NOT NULL,
	quant integer NOT NULL,
    CONSTRAINT fk_comprapp_produto FOREIGN KEY (codpro) REFERENCES produto(codpro),
    CONSTRAINT fk_comprapp_compra FOREIGN KEY (codc) REFERENCES compra(codc)
);
--
CREATE TABLE contas(
	codcon serial NOT NULL,
	tipo varchar(20) NOT NULL,
	valor FLOAT NOT NULL,
	datavenc DATE NULL,
	datapag DATE NULL,
	codv integer NULL,
	codc integer NULL,
	CONSTRAINT pk_contas PRIMARY KEY (codcon),
    CONSTRAINT fk_contas_venda FOREIGN KEY (codv) REFERENCES venda(codv),
    CONSTRAINT fk_contas_compra FOREIGN KEY (codc) REFERENCES compra(codc)
);
--
insert into pessoa (codp, login, senha, nome, tipop, doc, docest, tel, email, tipo, logradouro, num, complemento, bairro, cidade) values
  (1,'ada@gmail.com','ada1','Ada','0',11111111111,11111111,49999111111,'ada@gmail.com','ADM','Fernando Machado',111,'apto101','centro','Chapecó'),
  (2,'ada2@gmail.com','ada2','Joao','0',22222222222,22222222,49999222222,'ada2@gmail.com','funcionario','Fernando Machado',122,'apto102','centro','Chapecó'),
  (3,'ada3@gmail.com','ada3','Lupo','1',33333333333333,33333333,49999333333,'ada3@gmail.com','fornecedor','Nereu',133,'apto103','jardim italia','Chapecó'),
  (4,'ada4@gmail.com','ada3','Rafael','0',44444444444444,44444444,49999444444,'ada4@gmail.com','cliente','porto alegre',144,'apto104','Lider','Chapecó'),
  (5,'ada5@gmail.com','ada5','ada','0',55555555555,55555555,49999555555,'ada5@gmail.com','cliente','rio de janeiro',155,'apto105','centro','Chapecó'),
  (6,'ada6@gmail.com','ada6','HOPE','1',66666666666666,66666666,49999666666,'ada6@gmail.com','fornecedor','Nereu',166,'apto106','jardim italia','Chapecó');
--
insert into produto (codpro, descricao, valor) values
  (1,'calça reta','50.50'),
  (2,'leg','70.50'),
  (3,'calcinha fio','99.50'),
  (4,'blusa','88.00'),
  (5,'camisa polo','55.00'),
  (6,'calça skin','50.50'),
  (7,'bermuda','70.50'),
  (8,'calcinha sem costura','99.50'),
  (9,'calcinha renda','88.00'),
  (10,'saia','55.00');
--
insert into compra (codc, descr, valor, valordesc, codp) values
  (1,'calça reta','25.00',null,3),
  (2,'calça skin','25.00',null,3),
  (3,'blusa','25.00',null,3),
  (4,'saia','25.00',null,3),
  (5,'calcinha fio','25.00',null,6),
  (6,'calcinha sem costura','25.00',null,6),
  (7,'calcinha renda','25.00',null,6),
  (8,'camisa polo','25.00','5.00',3),
  (9,'leg','25.00',null,3),
  (10,'bermuda','25.00',null,3);
--
insert into comprapp (codpro, codc, quant) values
  (1,1,10),
  (2,9,10),
  (3,5,10),
  (4,3,10),
  (5,8,10),
  (6,2,10),
  (7,10,10), 
  (8,6,10),
  (9,7,10),
  (10,4,10);
--
insert into venda (codv, descr, valor, valordesc, codp) values
  (1,'calça reta','50.50','5.00',2),
  (2,'calça skin','50.50',null,4),
  (3,'blusa','88.00',null,5),
  (4,'saia','55.00',null,4),
  (5,'calcinha fio','99.50',null,5),
  (6,'calcinha sem costura','99.50',null,6),
  (7,'calcinha renda','88.00',null,6),
  (8,'camisa polo','55.00','5.00',2),
  (9,'leg','70.50','15.00',1),
  (10,'bermuda','70.50',null,3);
--
insert into vendapp (codpro, codv, quant) values
  (1,1,2),
  (2,9,1),
  (3,5,3),
  (4,3,5),
  (5,8,2),
  (6,2,4),
  (7,10,3),
  (8,6,2),
  (9,7,3),
  (10,4,2);
--
insert into contas (codcon, tipo, valor, datavenc, datapag, codv, codc) values
  (1,'compra','250.00','10/11/2021',null,null,1),
  (2,'compra','250.00','10/10/2021','10/10/2021',null,1),
  (3,'compra','250.00','10/11/2021',null,null,1),
  (4,'compra','250.00','10/10/2021','10/10/2021',null,1),
  (5,'compra','250.00','10/11/2021',null,null,1),
  (6,'compra','250.00','10/11/2021',null,null,1),
  (7,'compra','250.00','10/11/2021',null,null,1),
  (8,'compra','200.00','10/11/2021',null,null,1),
  (9,'compra','250.00','10/11/2021',null,null,1),
  (10,'compra','250.00','10/11/2021',null,null,1),
  (11,'compra','91.00','10/11/2021',null,null,1),
  (12,'compra','50.50','10/10/2021','10/10/2021',null,1),
  (13,'compra','264.00','10/11/2021',null,null,1),
  (14,'compra','497.50','10/10/2021','10/10/2021',null,1),
  (15,'compra','199.00','10/11/2021',null,null,1),
  (16,'compra','398.00','10/11/2021',null,null,1),
  (17,'compra','264.00','10/11/2021',null,null,1),
  (18,'compra','100.00','10/11/2021',null,null,1),
  (19,'compra','166.50','10/11/2021',null,null,1),
  (20,'compra','141.00','10/11/2021',null,null,1);




