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
    'Maria Fernandes',
    '12345678901',
    NULL,
    '11987654321',
    'maria.fernandes@example.com',
    3,
    'Rua B',
    '101',
    'Centro',
    'SP',
    '01001-000',
    '2024-06-09 21:37'
  ),
  (
    'Empresa XYZ',
    NULL,
    '23456789000185',
    '21987654321',
    'contato@empresaxyz.com',
    5,
    'Avenida C',
    '202',
    'Botafogo',
    'RJ',
    '20001-000',
    '2024-06-09 21:37'
  ),
  (
    'Paula Castro',
    '34567890123',
    NULL,
    '31987654321',
    'paula.castro@example.com',
    2,
    'Rua D',
    '303',
    'Savassi',
    'MG',
    '30000-000',
    '2024-06-09 21:37'
  );