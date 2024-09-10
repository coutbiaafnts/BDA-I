begin;

create table usuario (
	id_usuario serial not null primary key,
	nome varchar(255),
	email varchar(255),
	senha varchar(255),
	cpf varchar(11),
	data_nasc date,
	cargo varchar(255),
	salario decimal(10,2),
	rua varchar(255),
	numero varchar(255),
	bairro varchar(255),
	cidade varchar(255),
	estado varchar(255),
	cep varchar(255),
	data_cad_us timestamp
);

create table cliente (
	id_cliente serial not null primary key,
	nome varchar(255),
	cpf varchar(11),
	cnpj varchar(14),
	telefone varchar(255),
	email varchar(255),
	frequencia int,
	rua varchar(255),
	numero varchar(255),
	bairro varchar(255),
	estado varchar(255),
	cep varchar(255),
	data_cad_cli timestamp
);

-- tabela resultado do script .sql tabela_cliente_frequente mínimo de (5) compras em dias diferentes
create table cliente_frequente (
	id_cliente_fr serial not null primary key,
	id_cliente int,
	nome varchar(255),
	qtd_frequencia int,
	desconto decimal(10,2),
	foreign key(id_cliente) references cliente(id_cliente)
);

create table fornecedor (
	id_fornecedor serial not null primary key,
	nome varchar(255),
	telefone varchar(255),
	email varchar(255),
	cnpj varchar(255),
	rua varchar(255),
	numero varchar(255),
	bairro varchar(255),
	cidade varchar(255),
	estado varchar(255),
	cep varchar(255),
	data_cad_forn timestamp
);

create table produto (
	id_produto serial not null primary key,
	nome varchar(255),
	categoria varchar(255),
	quantidade_estq int,
	quantidade_min int,
	quantidade_perdida int, 
	preco_venda decimal(10,2),
	preco_compra decimal(10,2),
	data_cad_prod timestamp
);

create table fornecimento (
	id_fornecimento serial not null primary key,
	id_fornecedor int,
	id_produto int,
	foreign key(id_fornecedor) references fornecedor(id_fornecedor),
	foreign key(id_produto) references produto(id_produto)
);

-- tabela resultado do script .sql tabela_relatorio_estq
create table relatorio_estq (
	id_relatorio_estq serial not null primary key,
	id_produto int,
	id_usuario int,
	nome_usuario varchar(255),
	prod_men_vend varchar(255),
	prod_mais_vend varchar(255),
	prod_falta varchar(255),
	prod_baixo_estq varchar(255),
	data_relatorio timestamp,
	foreign key(id_produto) references produto(id_produto),
	foreign key(id_usuario) references usuario(id_usuario)
);

-- tabela resultado do script .sql tabela_comprovante
create table comprovante (
	id_comprovante serial not null primary key,
	nome_cliente varchar(255),
	cpf_cliente varchar(255),
	cnpj_cliente varchar(255),
	telefone_cliente varchar(255),
	id_produto int, -- puxa da coluna id_produto da tabela item_venda
	produto varchar(255), -- puxa da coluna nome da tabela produto
	quantidade int, -- puxa da coluna quantidade da tabela item_venda
	valor_item decimal(10,2), -- puxa da coluna preco_venda da tabela produto
	valor_total decimal(10,2), -- valor total de cada item
	valor_compra decimal(10,2), -- soma dos valores totais
	forma_pagamento varchar(255), -- puxa da coluna forma_pagamento da tabela venda
	data_emissao timestamp
);

create table item_venda (
	id_item serial not null primary key,
	id_produto int,
	quantidade int,
	foreign key(id_produto) references produto(id_produto)
);

-- tabela resultado do script .sql tabela_relatorio_finan
create table relatorio_finan (
	id_relatorio_finan serial not null primary key,
	id_usuario int,
	nome_usuario varchar(255),
	total_vendido decimal(10,2),
	total_receber decimal(10,2),
	total_caixa decimal(10,2),
	data_relatorio timestamp,
	foreign key(id_usuario) references usuario(id_usuario)
);

create table venda (
	id_venda serial not null primary key,
	id_item int,
	id_relatorio_finan int,
	id_usuario int,
	id_cliente int,
	id_comprovante int,
	total decimal(10,2), 
	forma_pagamento varchar(255), -- dinheiro, pix, crédito e débito
	data_venda timestamp,
	foreign key(id_item) references item_venda(id_item),
	foreign key(id_relatorio_finan) references relatorio_finan(id_relatorio_finan),
	foreign key(id_usuario) references usuario(id_usuario),
	foreign key(id_cliente) references cliente(id_cliente),
	foreign key(id_comprovante) references comprovante(id_comprovante)
);

create table despesas (
	id_despesa serial not null primary key,
	id_relatorio_finan int,
	nome varchar(255),
	descricao varchar(255),
	categoria varchar(255), -- variável, fixa 
	valor decimal(10,2),
	data_vencimento date,
	data_pagamento date,
	foreign key(id_relatorio_finan) references relatorio_finan(id_relatorio_finan)
);

commit;