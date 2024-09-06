SELECT
  cli.nome as nome_cliente,
  cli.cpf as cpf_cliente,
  cli.cnpj as cnpj_cliente,
  cli.telefone as telefone_cliente,
  prod.nome as nome_produto,
  prod.codigo_p as id_produto,
  prod.preco_venda as valor_produto,
  item.qtd_item as quantidade_produto,
  SUM(prod.preco_venda * item.qtd_item) as total_venda
FROM
  venda as vend
  JOIN comprovante as comp ON comp.codigo_cp = vend.cod_comprovante
  JOIN item_produto as item ON vend.cod_item = item.codigo_i
  JOIN cliente as cli ON vend.cod_cliente = cli.codigo_c
  JOIN produto as prod ON item.cod_produto = prod.codigo_p
GROUP BY
  cli.nome,
  cli.cpf,
  cli.cnpj,
  cli.telefone,
  prod.nome,
  prod.preco_venda,
  item.qtd_item;