SELECT
	cliente_frequente.id_cliente_fr,
	cliente.id_cliente as id_cliente,
	cliente.nome as nome,
	COUNT(DISTINCT DATE(venda.data_venda)) as qtd_frequencia,
	desconto
FROM 
	cliente_frequente
	JOIN cliente ON cliente.id_cliente = cliente_frequente.id_cliente
	JOIN venda ON cliente.id_cliente = venda.id_cliente
GROUP BY
	cliente_frequente.id_cliente_fr,
	cliente.id_cliente,
	cliente.nome
HAVING
  	COUNT(DISTINCT DATE(venda.data_venda)) > 5;