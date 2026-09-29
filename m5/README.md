# entregas de desafios do módulo 5

Entrega para o primeiro desafio é a imagem `desafio 1 -[...].png`

## Detalhes do desafio: Modelando um Dashboard de E-commerce com Power BI Utilizando Fórmulas DAX

A seguir detalhes do desenvolvimento desse desafio.

### Processando os dados

1. Importei os dados da fonte
2. Alterei os tipos de dados da fonte
3. A tabela de origem foi renomeada para `financial_origem`
4. Criei uma nova consulta referenciando a tabela de origem chamada `d_produtos`
   1. Nessa tabela, agrupei as informações conforme solicitado no enunciado
   2. Ordenei alfabeticamente pelo nome em `d_produtos`
   3. Criei uma coluna de índice e a renomeei para `id_produto`
   - Preferi essa abordagem em vez de definir manualmente o ID de cada produto

5. Criei uma nova consulta referenciando a tabela de origem chamada `d_descontos`
   1. Removi as colunas desnecessárias
   2. Mesclei com `d_produtos` e expandi os IDs de produto
   3. Agreguei as colunas de `id_produto` e banda de desconto para obter informações resumidas
   4. Criei uma _surrogate key_ com base no valor do `id_produto` e da banda de desconto

6. Criei uma nova consulta referenciando a tabela de origem chamada `d_produtos_detalhes`
   1. Eliminei as colunas desnecessárias
   2. Mesclei com `d_produtos` com base no nome do produto e expandi o ID
   - Assim, mantive o detalhamento dos campos para todas as variações históricas

7. Criei uma nova consulta referenciando a tabela de origem chamada `d_segmentos`
   1. Mantive as colunas de segmento e país
   2. Removi as linhas duplicadas
   3. Adicionei o `id_segmento` para essa dimensão

8. Criei uma nova consulta referenciando a tabela de origem chamada `d_vendas`
   1. Mesclei com `d_produtos` e expandi o `id_produto`
   2. Criei a _surrogate key_ para `d_vendas` (`sk_id`)
   3. Removi as colunas de acordo com as instruções
   4. Mesclei com `d_segmentos` e expandi o `id_segmento`
   5. Mesclei o `id_produto` com a banda de desconto para calcular o ID do desconto

9. Com DAX, criei a tabela `d_tempo` com diversas colunas/medidas de tempo
   1. O nome do mês foi calculado com `FORMAT(d_tempo[Date], "mmm", "pt-BR")`
   2. O ano-mês foi calculado com `FORMAT(d_tempo[Date], "YYYYMM")`

10. Estabeleci as conexões com a tabela fato (`d_tempo`, `d_segmentos`, `d_produtos`)
    1. A tabela `d_produtos_detalhes` foi conectada à `d_produtos`

#### Obs.:

- Não criei tabelas de detalhes (julguei desnecessário)

### imagem do schema

![modelo estrela](./desafio%202%20-%20modelo%20estrela.png)
