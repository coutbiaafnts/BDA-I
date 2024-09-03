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
	codigo_f int not null primary key,
	nome varchar(255),
	telefone varchar(255),
	email varchar(255),
	cnpj varchar(14),
	data_cad_forn timestamp,
  rua varchar(255),
  numero int,
  bairro varchar(255),
  cidade varchar(255),
  estado varchar(255),
  cep varchar(8)
);

create table produto (
	codigo_p int not null primary key,
	nome varchar(255), 
	categoria varchar(25),
	quantidade int,
	qtd_perdida int,
	preco_venda decimal,
	preco_compra decimal,
	data_cad_prod timestamp,
	cod_relatorio int not null,
	foreign key(cod_relatorio) references relatorio(codigo_r)
);

create table fornecimento (
	codigo_ft int not null primary key,
	cod_fornecedor int not null,
	cod_produto int not null,
	foreign key(cod_fornecedor) references fornecedor(codigo_f),
	foreign key(cod_produto) references produto(codigo_p)
);

create table item_produto (
	codigo_i int not null primary key,
	qtd_item int,
	cod_produto int not null,
	foreign key(cod_produto) references produto(codigo_p)
);

create table comprovante (
	codigo_cp int not null primary key,
	nome varchar(255),
	cpf varchar(11),
	cnpj varchar(14),
	telefone varchar(255),
	data_emissao timestamp 
);

create table venda (
	codigo_v int not null primary key,
	total_venda decimal,
	data_venda timestamp,
	cod_item int not null,
	cod_cliente int not null,
	cod_usuario int not null,
	cod_comprovante int not null,
	foreign key(cod_item) references item_produto(codigo_i),
	foreign key(cod_cliente) references cliente(codigo_c),
	foreign key(cod_usuario) references usuario(codigo_u),
	foreign key(cod_comprovante) references comprovante(codigo_cp)
);

create table despesas (
	codigo_d int not null primary key,
	nome varchar(255),
	descricao varchar(255),
	categoria varchar(25),
	valor decimal,
	data_venc date,
	data_pag date
);

commit;