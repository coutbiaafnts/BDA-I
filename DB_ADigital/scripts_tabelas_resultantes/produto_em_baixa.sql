SELECT
  produto.nome AS produto,
  produto.quantidade_estq
FROM
  produto
WHERE
  produto.quantidade_estq <= < quantidade_minima >;