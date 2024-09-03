begin;

create table usuario (
	codigo_u int not null primary key,
	nome varchar(255),
	email varchar(255),
	senha varchar(12),
	cpf varchar(11),
	cargo varchar(25),
	data_nasc date,
	data_cad_usuario timestamp,
  salario decimal,
  rua varchar(255),
  numero int,
  bairro varchar(255),
  cidade varchar(255),
  estado varchar(255),
  cep varchar(8)
);

create table relatorio (
	codigo_r int not null primary key,
	prod_men_vend varchar(255),
	prod_mais_vend varchar(255),
	prod_falta varchar(255),
	prod_baixo_estq varchar(255),
	cod_usuario int not null,
	foreign key(cod_usuario) references usuario(codigo_u)
);

create table cliente (
	codigo_c int not null primary key,
	nome varchar(255),
	cnpj varchar(14),
	cpf varchar(11),
	telefone varchar(255),
	email varchar(255),
	frequencia int,
	desconto decimal,
	data_cad_cli timestamp,
  rua varchar(255),
  numero int,
  bairro varchar(255),
  cidade varchar(255),
  estado varchar(255),
  cep varchar(8)
);

create table fornecedor (
	CodigoF int not null primary key,
	Nome varchar(255),
	Telefone varchar(255),
	Email varchar(255),
	Cnpj varchar(14),
	Data_cad_forn timestamp,
  rua varchar(255),
  numero int,
  bairro varchar(255),
  cidade varchar(255),
  estado varchar(255),
  cep varchar(8)
);

create table produto (
	CodigoP int not null primary key,
	Nome varchar(255), 
	Categoria varchar(25),
	Quantidade int,
	Qtd_perdida int,
	Preco_venda decimal,
	preco_compra decimal,
	Data_cad_prod timestamp,
	Cod_relatorio int not null,
	foreign key(Cod_relatorio) references relatorio(CodigoR)
);

create table fornecimento (
	CodigoFt int not null primary key,
	Cod_fornecedor int not null,
	Cod_produto int not null,
	foreign key(Cod_fornecedor) references fornecedor(CodigoF),
	foreign key(Cod_produto) references produto(CodigoP)
);

create table item_produto (
	CodigoI int not null primary key,
	Qtd_item int,
	Cod_produto int not null,
	foreign key(Cod_produto) references produto(CodigoP)
);

create table comprovante (
	CodigoCp int not null primary key,
	Nome varchar(255),
	Cpf varchar(11),
	Cnpj varchar(14),
	Telefone varchar(255),
	Data_emissao timestamp 
);

create table venda (
	CodigoV int not null primary key,
	Total_venda decimal,
	Data_venda timestamp,
	Cod_item int not null,
	Cod_cliente int not null,
	Cod_usuario int not null,
	Cod_comprovante int not null,
	foreign key(Cod_item) references item_produto(CodigoI),
	foreign key(Cod_cliente) references cliente(CodigoC),
	foreign key(Cod_usuario) references usuario(CodigoU),
	foreign key(Cod_comprovante) references comprovante(CodigoCp)
);

create table despesas (
	CodigoD int not null primary key,
	Nome varchar(255),
	Descricao varchar(255),
	Categoria varchar(25),
	Valor decimal,
	Data_venc date,
	Data_pag date
);

commit;