SELECT
  usuario.nome
  COUNT(venda.id_venda)
FROM venda
JOIN usuario ON
  usuario.id_usuario = venda.id_usuario
GROUP BY
  usuario.nome;