SELECT
  produto.nome AS produto,
  SUM(item_venda.quantidade) AS total_vendido
FROM
  produto
  JOIN item_venda ON produto.id_produto = item_venda.id_produto
GROUP BY
  produto.nome
ORDER BY
  total_vendido ASC
LIMIT
  1;