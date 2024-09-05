begin;

create table usuario (
	codigo_u serial not null primary key,
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
-- criando os dados para a tabela de usuário
INSERT INTO usuario (nome, email, senha, cpf, cargo, data_nasc, data_cad_usuario, salario, rua, numero, bairro, cidade, estado, cep)
VALUES 
('João Silva', 'joao.silva@adigital.com', 'senha123', '12345678901', 'Gerente', '1985-05-10', '2024-09-01 08:30:00', 6500.00, 'Rua das Flores', 123, 'Centro', 'São João Evangelista', 'MG', '39705000'),
('Ana Pereira', 'ana.pereira@adigital.com', 'senha456', '23456789012', 'Vendedor', '1990-09-15', '2024-09-01 08:45:00', 3500.00, 'Rua do Comércio', 456, 'Bela Vista', 'São João Evangelista', 'MG', '39705001'),
('Carlos Souza', 'carlos.souza@adigital.com', 'senha789', '34567890123', 'Caixa', '1992-03-12', '2024-09-01 09:00:00', 3000.00, 'Avenida Central', 789, 'Centro', 'São João Evangelista', 'MG', '39705002'),
('Beatriz Lima', 'beatriz.lima@adigital.com', 'senha012', '45678901234', 'Suporte Técnico', '1988-07-22', '2024-09-01 09:15:00', 4500.00, 'Rua dos Andes', 987, 'Vila Nova', 'São João Evangelista', 'MG', '39705003'),
('Lucas Mendes', 'lucas.mendes@adigital.com', 'senha345', '56789012345', 'Estoque', '1995-11-02', '2024-09-01 09:30:00', 3200.00, 'Rua da Paz', 654, 'Jardim das Flores', 'São João Evangelista', 'MG', '39705004'),
('Mariana Dias', 'mariana.dias@adigital.com', 'senha678', '67890123456', 'Recepcionista', '1996-12-18', '2024-09-01 09:45:00', 2800.00, 'Rua das Palmeiras', 321, 'Centro', 'São João Evangelista', 'MG', '39705005'),
('Rafael Gomes', 'rafael.gomes@adigital.com', 'senha901', '78901234567', 'Vendedor', '1989-02-05', '2024-09-01 10:00:00', 3500.00, 'Avenida Brasil', 159, 'Centro', 'São João Evangelista', 'MG', '39705006'),
('Fernanda Silva', 'fernanda.silva@adigital.com', 'senha234', '89012345678', 'Gerente de Vendas', '1984-06-29', '2024-09-01 10:15:00', 7000.00, 'Rua do Sol', 852, 'Bela Vista', 'São João Evangelista', 'MG', '39705007'),
('Paulo Ribeiro', 'paulo.ribeiro@adigital.com', 'senha567', '90123456789', 'Assistente Administrativo', '1993-04-14', '2024-09-01 10:30:00', 3500.00, 'Rua Nova', 753, 'Centro', 'São João Evangelista', 'MG', '39705008'),
('Patrícia Oliveira', 'patricia.oliveira@adigital.com', 'senha890', '01234567890', 'Analista de TI', '1991-08-19', '2024-09-01 10:45:00', 5500.00, 'Rua do Comércio', 147, 'Centro', 'São João Evangelista', 'MG', '39705009');

create table relatorio (
	codigo_r serial not null primary key,
	prod_men_vend varchar(255),
	prod_mais_vend varchar(255),
	prod_falta varchar(255),
	prod_baixo_estq varchar(255),
	cod_usuario int not null,
	foreign key(cod_usuario) references usuario(codigo_u)
);
-- criando dados para a tabela de relatórios
INSERT INTO relatorio (prod_men_vend, prod_mais_vend, prod_falta, prod_baixo_estq, cod_usuario)
VALUES
('Cadeira Gamer', 'Smartphone Samsung', 'Notebook Dell', 'Mesa Escritório', 1),
('Mesa Escritório', 'Geladeira Brastemp', 'Cadeira Gamer', 'Notebook Dell', 2),
('Geladeira Brastemp', 'Notebook Dell', 'Smartphone Samsung', 'Cadeira Gamer', 3);


create table cliente (
	codigo_c serial not null primary key,
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
-- criando os dados para a tabela de clientes
INSERT INTO cliente (nome, cnpj, cpf, telefone, email, frequencia, desconto, data_cad_cli, rua, numero, bairro, cidade, estado, cep)
VALUES 
('Empresa Alpha', '12345678000199', NULL, '31987654321', 'contato@empresaalpha.com', 10, 5.00, '2024-09-02 09:00:00', 'Rua Industrial', 789, 'Centro', 'São João Evangelista', 'MG', '39705002'),
('Maria Oliveira', NULL, '34567890123', '31998765432', 'maria.oliveira@example.com', 5, 2.50, '2024-09-03 10:30:00', 'Rua do Sol', 321, 'Alvorada', 'São João Evangelista', 'MG', '39705003'),
('Pedro Santos', NULL, '56789012345', '31987654322', 'pedro.santos@example.com', 15, 7.50, '2024-09-04 14:00:00', 'Av. Central', 890, 'Centro', 'São João Evangelista', 'MG', '39705030'),
('Empresa Beta', '98765432000111', NULL, '31987654323', 'contato@empresabeta.com', 12, 6.00, '2024-09-02 11:00:00', 'Rua das Indústrias', 678, 'Industrial', 'São João Evangelista', 'MG', '39705011'),
('Carlos Almeida', NULL, '67890123456', '31987654324', 'carlos.almeida@example.com', 7, 3.00, '2024-09-03 15:00:00', 'Rua das Flores', 567, 'Bela Vista', 'São João Evangelista', 'MG', '39705012'),
('Empresa Gama', '22334455000122', NULL, '31987654325', 'contato@empresagama.com', 20, 10.00, '2024-09-02 13:00:00', 'Av. Brasil', 456, 'Centro', 'São João Evangelista', 'MG', '39705013'),
('Ana Clara', NULL, '78901234567', '31987654326', 'ana.clara@example.com', 8, 4.00, '2024-09-03 17:00:00', 'Rua da Paz', 345, 'Alvorada', 'São João Evangelista', 'MG', '39705014'),
('Empresa Delta', '55667788000133', NULL, '31987654327', 'contato@empresadelta.com', 15, 7.00, '2024-09-02 14:00:00', 'Rua dos Andes', 234, 'Industrial', 'São João Evangelista', 'MG', '39705015'),
('Lucas Martins', NULL, '89012345678', '31987654328', 'lucas.martins@example.com', 9, 4.50, '2024-09-03 19:00:00', 'Rua Nova', 123, 'Centro', 'São João Evangelista', 'MG', '39705016'),
('Empresa Zeta', '88990044000144', NULL, '31987654329', 'contato@empresazeta.com', 18, 8.00, '2024-09-02 16:00:00', 'Av. Paulista', 901, 'Bela Vista', 'São João Evangelista', 'MG', '39705017');

create table fornecedor (
	codigo_f serial not null primary key,
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
-- criando os dados para a tabela de fornecedores
INSERT INTO fornecedor (nome, telefone, email, cnpj, data_cad_forn, rua, numero, bairro, cidade, estado, cep)
VALUES 
('Fornecedor A', '31987654310', 'fornecedorA@example.com', '12345678000100', '2024-09-02 08:30:00', 'Rua Comercial', 101, 'Centro', 'São João Evangelista', 'MG', '39705018'),
('Fornecedor B', '31987654311', 'fornecedorB@example.com', '23456789000111', '2024-09-02 09:00:00', 'Av. Brasil', 102, 'Bela Vista', 'São João Evangelista', 'MG', '39705019'),
('Fornecedor C', '31987654312', 'fornecedorC@example.com', '34567890000122', '2024-09-02 09:30:00', 'Rua das Flores', 103, 'Alvorada', 'São João Evangelista', 'MG', '39705020'),
('Fornecedor D', '31987654313', 'fornecedorD@example.com', '45678901000133', '2024-09-02 10:00:00', 'Rua do Comércio', 104, 'Centro', 'São João Evangelista', 'MG', '39705021'),
('Fornecedor E', '31987654314', 'fornecedorE@example.com', '56789012000144', '2024-09-02 10:30:00', 'Av. Central', 105, 'Industrial', 'São João Evangelista', 'MG', '39705022'),
('Fornecedor F', '31987654315', 'fornecedorF@example.com', '67890123000155', '2024-09-02 11:00:00', 'Rua dos Andes', 106, 'Centro', 'São João Evangelista', 'MG', '39705023'),
('Fornecedor G', '31987654316', 'fornecedorG@example.com', '78901234000166', '2024-09-02 11:30:00', 'Rua Nova', 107, 'Centro', 'São João Evangelista', 'MG', '39705024'),
('Fornecedor H', '31987654317', 'fornecedorH@example.com', '89012345000177', '2024-09-02 12:00:00', 'Rua da Paz', 108, 'Centro', 'São João Evangelista', 'MG', '39705025'),
('Fornecedor I', '31987654318', 'fornecedorI@example.com', '90123456000188', '2024-09-02 12:30:00', 'Rua do Sol', 109, 'Centro', 'São João Evangelista', 'MG', '39705026'),
('Fornecedor J', '31987654319', 'fornecedorJ@example.com', '01234567000199', '2024-09-02 13:00:00', 'Av. Paulista', 110, 'Bela Vista', 'São João Evangelista', 'MG', '39705027');

create table produto (
	codigo_p serial not null primary key,
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
-- criando dados para a tabela de produtos
INSERT INTO produto (nome, categoria, quantidade, qtd_perdida, preco_venda, preco_compra, data_cad_prod, cod_relatorio)
VALUES
('Notebook Dell', 'Eletrônicos', 50, 2, 3500.00, 3000.00, '2024-05-09 13:27:00', 1),
('Cadeira Gamer', 'Móveis', 30, 1, 800.00, 600.00, '2024-05-09 13:27:00', 2),
('Smartphone Samsung', 'Eletrônicos', 100, 5, 2500.00, 2000.00, '2024-05-09 13:27:00', 1),
('Mesa Escritório', 'Móveis', 20, 0, 450.00, 300.00, '2024-05-09 13:27:00', 2),
('Geladeira Brastemp', 'Eletrodomésticos', 10, 0, 3200.00, 2800.00, '2024-05-09 13:27:00', 3);

create table fornecimento (
	codigo_ft serial not null primary key,
	cod_fornecedor int not null,
	cod_produto int not null,
	foreign key(cod_fornecedor) references fornecedor(codigo_f),
	foreign key(cod_produto) references produto(codigo_p)
);
-- criando dados para a tabela de fornecimentos
INSERT INTO fornecimento (cod_fornecedor, cod_produto)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

create table item_produto (
	codigo_i serial not null primary key,
	qtd_item int,
	cod_produto int not null,
	foreign key(cod_produto) references produto(codigo_p)
);
-- criando dados para a tabela de item_produto
INSERT INTO item_produto (qtd_item, cod_produto)
VALUES
(10, 1),
(5, 2),
(20, 3),
(15, 4),
(8, 5);

create table comprovante (
	codigo_cp serial not null primary key,
	nome varchar(255),
	cpf varchar(11),
	cnpj varchar(14),
	telefone varchar(255),
	data_emissao timestamp 
);
-- criando dados para a tabela de comprovantes
INSERT INTO comprovante (nome, cpf, cnpj, telefone, data_emissao)
VALUES
('João Silva', '12345678901', NULL, '31987654321', '2024-09-05 09:00:00'),
('Empresa Alpha', NULL, '12345678000199', '31987654322', '2024-09-05 09:30:00'),
('Maria Oliveira', '34567890123', NULL, '31998765432', '2024-09-05 10:00:00');


create table venda (
	codigo_v serial not null primary key,
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
-- criando dados ara a tabela de vendas
INSERT INTO venda (total_venda, data_venda, cod_item, cod_cliente, cod_usuario, cod_comprovante)
VALUES
(3500.00, '2024-09-05 11:00:00', 1, 1, 1, 1),
(800.00, '2024-09-05 11:30:00', 2, 2, 2, 2),
(2500.00, '2024-09-05 12:00:00', 3, 3, 3, 3);

create table despesas (
	codigo_d serial not null primary key,
	nome varchar(255),
	descricao varchar(255),
	categoria varchar(25),
	valor decimal,
	data_venc date,
	data_pag date
);
-- criando dados para a tabela de despesas
INSERT INTO despesas (nome, descricao, categoria, valor, data_venc, data_pag)
VALUES
('Aluguel', 'Pagamento mensal do aluguel do escritório', 'Fixa', 2500.00, '2024-05-10', '2024-05-09'),
('Internet', 'Serviço de internet empresarial', 'Fixa', 200.00, '2024-05-15', '2024-05-14'),
('Material de Escritório', 'Compra de papel e canetas', 'Variável', 150.00, '2024-05-20', '2024-05-19'),
('Conta de Luz', 'Energia elétrica do escritório', 'Fixa', 300.00, '2024-05-25', '2024-05-24'),
('Marketing', 'Campanha de anúncios online', 'Variável', 500.00, '2024-05-30', NULL);

commit;