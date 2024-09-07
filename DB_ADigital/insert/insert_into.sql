INSERT INTO
  usuario (
    nome,
    email,
    senha,
    cpf,
    data_nasc,
    cargo,
    salario,
    rua,
    numero,
    bairro,
    cidade,
    estado,
    cep,
    data_cad_us
  )
VALUES
  (
    'Ana Souza',
    'ana.souza@example.com',
    'senha123',
    '12345678901',
    '1985-06-15',
    'Gerente',
    7500.00,
    'Rua das Flores',
    '123',
    'Centro',
    'São Paulo',
    'SP',
    '01001-000',
    '2024-06-09 10:00:00'
  ),
  (
    'Carlos Silva',
    'carlos.silva@example.com',
    'senha123',
    '23456789012',
    '1990-08-22',
    'Analista',
    5000.00,
    'Avenida Paulista',
    '456',
    'Bela Vista',
    'São Paulo',
    'SP',
    '01310-000',
    '2024-06-09 11:00:00'
  ),
  (
    'Mariana Lima',
    'mariana.lima@example.com',
    'senha123',
    '34567890123',
    '1992-11-05',
    'Desenvolvedor',
    6000.00,
    'Rua Augusta',
    '789',
    'Consolação',
    'São Paulo',
    'SP',
    '01305-000',
    '2024-06-09 12:00:00'
  );

INSERT INTO
  cliente (
    nome,
    cpf,
    cnpj,
    telefone,
    email,
    frequencia,
    rua,
    numero,
    bairro,
    estado,
    cep,
    data_cad_cli
  )
VALUES
  (
    'João Pereira',
    '45678901234',
    NULL,
    '11987654321',
    'joao.pereira@example.com',
    6,
    'Rua da Paz',
    '101',
    'Liberdade',
    'SP',
    '01503-001',
    '2024-06-09 09:00:00'
  ),
  (
    'Empresa ABC Ltda',
    NULL,
    '12345678000199',
    '1134567890',
    'contato@empresaabc.com',
    3,
    'Rua do Comércio',
    '202',
    'Centro',
    'SP',
    '01002-000',
    '2024-06-09 09:30:00'
  ),
  (
    'Maria Oliveira',
    '56789012345',
    NULL,
    '11912345678',
    'maria.oliveira@example.com',
    8,
    'Rua das Acácias',
    '303',
    'Jardins',
    'SP',
    '01403-002',
    '2024-06-09 10:00:00'
  );

INSERT INTO
  cliente_frequente (id_cliente, nome, qtd_frequencia, desconto)
VALUES
  (1, 'João Pereira', 6, 10),
  (3, 'Maria Oliveira', 8, 15);

INSERT INTO
  fornecedor (
    nome,
    telefone,
    email,
    cnpj,
    rua,
    numero,
    bairro,
    cidade,
    estado,
    cep,
    data_cad_forn
  )
VALUES
  (
    'Fornecedor XYZ',
    '1123456789',
    'contato@fornecedorxyz.com',
    '98765432000188',
    'Avenida do Progresso',
    '404',
    'Zona Industrial',
    'São Paulo',
    'SP',
    '01103-003',
    '2024-06-09 13:00:00'
  ),
  (
    'Distribuidora Alpha',
    '1123456790',
    'vendas@alpha.com',
    '87654321000177',
    'Rua das Indústrias',
    '505',
    'Distrito Industrial',
    'São Paulo',
    'SP',
    '01104-004',
    '2024-06-09 13:30:00'
  );

INSERT INTO
  produto (
    nome,
    categoria,
    quantidade_estq,
    quantidade_min,
    quantidade_perdida,
    preco_venda,
    preco_compra,
    data_cad_prod
  )
VALUES
  (
    'Produto A',
    'Eletrônicos',
    50,
    10,
    2,
    199.99,
    150.00,
    '2024-06-09 14:00:00'
  ),
  (
    'Produto B',
    'Vestuário',
    30,
    5,
    1,
    49.99,
    30.00,
    '2024-06-09 14:30:00'
  ),
  (
    'Produto C',
    'Alimentos',
    100,
    20,
    5,
    9.99,
    5.00,
    '2024-06-09 15:00:00'
  );

INSERT INTO
  fornecimento (id_fornecedor, id_produto)
VALUES
  (1, 1),
  (1, 2),
  (2, 3);

INSERT INTO
  relatorio_estq (
    id_produto,
    id_usuario,
    prod_men_vend,
    prod_mais_vend,
    prod_falta,
    prod_baixo_estq,
    data_relatorio
  )
VALUES
  (
    1,
    1,
    'Produto C',
    'Produto A',
    'Produto B',
    'Produto B',
    '2024-06-09 16:00:00'
  );

INSERT INTO
  comprovante (
    nome_cliente,
    cpf_cliente,
    cnpj_cliente,
    telefone_cliente,
    id_produto,
    produto,
    quantidade,
    valor_item,
    valor_total,
    valor_compra,
    forma_pagamento,
    data_emissao
  )
VALUES
  (
    'João Pereira',
    '45678901234',
    NULL,
    '11987654321',
    1,
    'Produto A',
    2,
    199.99,
    399.98,
    399.98,
    'crédito',
    '2024-06-09 17:00:00'
  );

INSERT INTO
  item_venda (id_produto, quantidade)
VALUES
  (1, 2),
  (2, 1),
  (3, 5);

INSERT INTO
  relatorio_finan (
    id_usuario,
    nome_usuario,
    total_vendido,
    total_receber,
    total_caixa,
    data_relatorio
  )
VALUES
  (
    1,
    'Ana Souza',
    1000.00,
    500.00,
    1500.00,
    '2024-06-09 18:00:00'
  );

INSERT INTO
  venda (
    id_item,
    id_relatorio_finan,
    id_usuario,
    id_cliente,
    id_comprovante,
    total,
    forma_pagamento,
    data_venda
  )
VALUES
  (
    1,
    1,
    1,
    1,
    1,
    399.98,
    'crédito',
    '2024-06-09 17:30:00'
  );

INSERT INTO
  despesas (
    id_relatorio_finan,
    nome,
    descricao,
    categoria,
    valor,
    data_vencimento,
    data_pagamento
  )
VALUES
  (
    1,
    'Aluguel',
    'Aluguel mensal da loja',
    'fixa',
    2000.00,
    '2024-06-30',
    '2024-06-05'
  );