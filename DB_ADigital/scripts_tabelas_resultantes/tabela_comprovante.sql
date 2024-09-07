SELECT
  cliente.nome as nome_cliente,
  cliente.cpf as cpf_cliente,
  cliente.cnpj as cnpj_cliente,
  cliente.telefone as telefone_cliente,
  item_venda.id_produto as id_produto,
  produto.nome as produto,
  item_venda.quantidade as quantidade_produto,
  produto.preco_venda as valor_item,
  SUM(produto.preco_venda * item_venda.quantidade) as valor_total,
  SUM(valor_total) as valor_compra
FROM
  venda
  JOIN comprovante ON comprovante.id_comprovante = venda.id_comprovante
  JOIN item_venda ON venda.ID_item = item_venda.id_item
  JOIN cliente ON venda.id_cliente = cliente.id_cliente
  JOIN produto ON item_venda.id_produto = produto.id_produto
GROUP BY
  cliente.nome,
  cliente.cpf,
  cliente.cnpj,
  cliente.telefone,
  item_venda.id_produto,
  produto.nome,
  item_venda.quantidade,
  produto.preco_venda;