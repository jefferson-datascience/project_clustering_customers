# Agrupamento dos Melhores Clientes da Empresa All in One Place

<img src="https://github.com/jefferson-datascience/project_clustering_customers/blob/main/figures/logo.png" alt="logo" style="zoom:90%;" />


#### O objetivo deste projeto é realizar a clusterização de clientes por meio de aprendizagem de máquina não supervisionado.

#### This project was made by Jefferson Henirque Candido.


# 1. Problema de Negócio.

 A empresa All in One Place é um Outlet Multimarcas, ou seja, ela comercializa produtos de segunda linha de várias marcas a um preço menor, através de um e-commerce.
    Em um pouco mais de 1 ano de operação, o time de marketing percebeu que alguns clientes de sua base compram produtos mais caros e com uma certa alta frequência, e consequentemente, acabam contribuindo com uma parcela significativa do faturamento da empresa.
    Baseado nessa percepção, o time de marketing vai lançar um programa de fidelidade para os melhores clientes da base, chamado Insiders. Todavia, o time não tem um conhecimento avançado em análise de dados para eleger os participantes do programa.
    Por esse motivo, o time de marketing requisitou ao time de dados uma seleção de clientes elegíveis ao programa, usando técnicas avançadas de manipulação de dados.

##### O Desafio

Determinar quem são os clientes elegíveis para participar do programa Insiders. Em posse dessa lista, o time de Marketing fará uma sequência de ações personalizadas e exclusivas ao grupo, de modo a aumentar o faturamento e a frequência de compra. Além disso, há algumas questões de negócio a serem respondidas.

#### Questões de Negócio

**1.** Quem são as pessoas elegíveis para participar do programa de Insiders?

**2.** Quantos clientes farão parte do grupo?

**3.** Quais são as principais características desses clientes?

**4.** Qual a porcentagem de contribuição do faturamento, vinda do Insiders?

**5.** Qual a expectativa de faturamento desse grupo para os próximos meses?

**6.** Quais as condições para uma pessoaser elegível ao Insiders? 

**7.** Quais as condições para uma pessoa ser removida do Insiders?

**8.** Qual a garantia que o programa Insiders é melhor que o restante da base?

**9.** Quais ações o time de marketing pode realizar para aumentar o faturamento? 

    
## Planejamento de Solução

**Qual é a solução para esse problema?** A solução para esse problema é o desenvolvimento de um modelo de clusterização(aprendizado de máquina não-supervisionado) para encontrar um grupo com os melhores clientes.

**Como vai ser o produto final?**  
- i. Dashboard no MetaBase atualizado todo dia 15 de todo mês por meio de uma insfraestrutura de Cloud Computing na AWS.
- ii. Arquivo .csv com todos os clientes do cluster insiders.
- iii. Relatório com as questões de negócio respondidas.
    

# 2. Business Assumptions.

#### Dados
- As transações das venda ocorreram entre os período de Novembro de 2016 a Dezembro de 2017.

#### Atributos

|**Atributos**   | **Descrição** |
|----------------|---------------|
|**InvoiceNo:**  | Número que identifica a transação da compra.|
|**StockCode:**  |           Código do produto.                |
|**Description:**|       Descrição do produto.|
|**Quantify:**   |       Quantidade comprada do produto.|
|**InvoiceDate:**|       Data em que a transação foi efetuada.|
|**UnitPrice:**  |       Preço unitário do produto comprado.|
|**CustomerID:** |      Número que identifica o cliente.|
|**Country:**    |   País em que o cliente realizou a transação.|

# 3. Estratégia de Solução

A estratégia para resolver esse problema foi:

**Etapa 00 - Coleta e Carregamento dos Dados:** Coleta de dados a partir de um arquivo .csv e estudo das variáveis.

**Etapa 01 - Descrição dos Dados:** Limpeza dos dados, checagem e preenchimento de valores nulos, mudança de naturaza das variáveis e estatística descritiva dos dados e breve estudos de outliers.

**Etapa 02 - Filtragem dos Dados:** Remoção de Dados desnecessário, filtragem de clientes que possuem somente faturamento positivo e remoção de outliers.

**Etapa 03 - Feature Engineering:** Criação de Variáveis para uma organização melhor do espaço de dados.

**Etapa 04 - Análise Exploratória:** Investigação mais afunda dos dados, estudo do espaço de dados original, estudo de espaço embedding com UMAP, T-SNE e Trees Embedding. 

**Etapa 05 - Preparação dos Dados:** Redimensionamento da escala dos dados.

**Etapa 06 - Seleção das Features:** Análise do comportamento das features selecionadas sobre os espaços de embedding e o espaço de dados, e, escolha do melhor espaço para clusterização.

**Etapa 07 - Fine Tunning de Hiperparâmetro:** Escolha dos Modelos de Clusterização, no caso, K-Means, Gaussian Mixture Model, Hierarchical Clustering, DBSCAN e análise de performance dos modelo utilizando silhouette score. 

**Etapa 08 - Treinamento do Modelo:** Treinamento do modelo escolhido sobre os três espaços. 

**Etapa 09 - Análise dos Clusters:** Análise dos clusters determinados pelos modelos e a investigação dos cluster pela visão de negócio.

**Etapa 10 - Deploy do Modelo em Produção:** Desenvolvimento da infraestrutura na AWS de ponta a ponta desde a criação da S3, ligação da EC2 e upload do banco de dados Postgres na RDS da Amazon. Deploy do modelo na EC2 que consome as informações na S3 e deposita os dados transformados no banco de dados Postgres. Elaboração do Dashboard no Metabase que consome os dados do Banco de Dados Postgres hospedados na RDS da Amazon.

# 4. Modelos de Machine Learning Utilizados

Para resolver esse problema, nós escolhemos os seguintes modelos:

- K-Means
- Hierarchical Clustering
- Gaussian Mixture Model
- DBSCAN

## Performance dos Modelos de Machine Learning

Para analisar a performance dos modelos de Machine Learning, nós utilizamos a silhouette score sobre cada espaço de dados para analisar melhor performance. 


#### Espaço de Features
|**Número de Clusters** | 2       |     3   |    4    |    5    |     6   |     7   |
|-----------------------|---------|---------|---------|---------|---------|---------|
|**kMeans Model**       |0.685804 |0.628754 |0.531541 |0.519266 |0.490362 |0.500192 |
|**GMM Model**          |-0.009367|-0.226330|-0.121346|-0.117001|-0.147114|-0.183835|
|**Hierarchical Model** |0.652177 |0.622043 |0.544948 |0.445219 |0.435247 |0.398956 |
|**DBSCAN Model**       |0.510000 |0.000000 |0.000000 |0.000000 |0.000000 |0.000000 |


#### Espaço de Embeeding - Trees
|**Número de Clusters** |2|3|4|5|6|7|8|9|10|11|12|13|14|
|-----------------------|-|-|-|-|-|-|-|-|--|--|--|--|--|
|**kMeans Model**       |0.387748|0.420496|0.407888|0.410816|0.412654|0.445922|0.451943|0.478262|0.502843|0.511563|0.525579|0.539400|0.552435|
|**GMM Model**          |0.387338 |0.415050|0.279055|0.277089|0.298699|0.316698|0.345374|0.391680|0.407511|0.444450|0.457036|0.499144|0.492762|
|**Hierarchical Model**  |0.353537|0.364492|0.374277|0.380910|0.405928|0.428638|0.439811|0.469397|0.476959|0.494094|0.499859|0.517916|0.528244|


#### Espaço de Embeeding - T-SNE
|**Número de Clusters** |2|3|4|5|6|7|8|9|10|11|12|13|14|
|-----------------------|-|-|-|-|-|-|-|-|--|--|--|--|--|
|**kMeans Model** |0.343229|0.387851|0.383945|0.365743|0.398486|0.409261|0.411761|0.415225|0.428772|0.434821|0.434122|0.431336|0.431794|
|**GMM Model** |0.326712|0.381288|0.296867|0.335003|0.357197|0.331231|0.282916|0.381790|0.279712|0.308954|0.350805|0.295413|0.390190|
|**Hierarchical Model** |0.325071|0.363674|0.352761|0.333878|0.311203|0.318458|0.353564|0.373879|0.401274|0.410461|0.416449|0.418348|0.419928|


#### Espaço de Embeeding - UMAP
|**Número de Clusters** |2|3|4|5|6|7|8|9|10|11|12|13|14|
|-----------------------|-|-|-|-|-|-|-|-|--|--|--|--|--|
|**kMeans Model**|0.427374|0.457138|0.455733|0.444487|0.453713|0.466439|0.492003|0.520514|0.532198|0.550515|0.555787|0.568117|0.541119|
|**GMM Model**|0.427377|0.342889|0.396329|0.420385|0.418542|0.408923|0.418259|0.458402|0.421660|0.442217|0.477680|0.475444|0.467722|
|**Hierarchical Model**|0.424543|0.399549|0.399572|0.437894|0.44673|0.453867|0.478580|0.490524|0.511983|0.533439|0.544080|0.554133|0.562982|

## Modelos Escolhidos: Hierarchical Clustering e K-means

Dada as performances, observamos que o desempenho dos modelos não foi como esperado, pois o espaço de dados original estava com os dados bem aglomerados, mesmo com a criação de novas features e com as técnicas de embedding, o que tornou o objetivo de agrupamento bem desafiador. Logo, temos que ser bem cautelosos na escolha do melhor modelo. 
<p>É interessante observar que, em termos de negócio, não vale a pena ter poucos clusters, pois podemos ter clientes bons e ruins em um mesmo grupo. Entretanto, também não podemos ter clusters demais, pois fica invabializado a administração de tanto grupos pelo time de Marketing.</p> 
<p>Assim, tomei a decisão de escolher 8 clusters para ser separado pelo modelo. Dado os espaços e a performance para 8 clusters, nós determinamos que os melhores modelos a ser escolhido para a clusterização eram os modelos K-Means e o Hierarchical sobre o espaço de embedding UMAP.</p> 


# 5. Análise de Performance de Negócio e Análise Gráfica dos Clusters

Ao observar a distribuição de dados, vemos que com a Clusterização do K-means há um overllaping dos clusters. Todavia, isso não ocorre no Hierarchical Clustering. Portanto, nós escolhemos o Hierarchical Clustering como modelo para ser colocado em produção.

### Clusterização com o K-Means
<img src="https://github.com/jefferson-datascience/project_clustering_customers/blob/main/figures/k-means_umap_graph.png" alt="logo" style="zoom:100%;" />

### Clusterização com o Hierarchical
<img src="https://github.com/jefferson-datascience/project_clustering_customers/blob/main/figures/hierarquical_umap_graph.png" alt="logo" style="zoom:100%;" />


Além disso, conseguimos uma ótima performance de negócio com o modelo Hierarchical Clustering. Segue abaixo os clusters e o cluster insiders descoberto: 

|   cluster   |	number_customers|	media_faturamento|	media_recencia|	media_produtos_comprados|	frequencia_compra 	|qtde_devolucoes|	number_customer_percentual|
|-------------|-----------------|------------------|---------------|-------------------------|--------------------|---------------|---------------------------|
|	3(Insiders)	|       1140	     |    5049.999096   |	     9.214035 |	       220.194737       |	     0.077869 	    |56.609649	     |        20.02              |
|	2           |       	737	     |    1719.801045   |	     33.755767|	       97.849389        |	     0.032154 	    |17.200814	     |        12.94              |
|	1           |	       417	     |    1463.513333   |	     72.683453|       	75.398082        |	     0.025305 	    |9.717026       |        	7.32              |
|	6	          |       776	      |    991.439665    |	    243.328608|	       57.085052        |	     0.401986 	    |20.701031	     |        13.63              | 
|	5           |       	260	     |    973.906423    |	    319.169231|	       70.911538        |	     1.007692 	    |286.603846	    |        4.57               |
|	8	          |       948	      |    657.156709    |     159.523207|	       53.187764        |	     1.018987 	    |1.868143	      |        16.65              |
|	4	          |       885	      |    613.597864    |     	41.358192|	       41.232768        |	     1.032647 	    |1.815789	      |        9.34               |



Logo, dada a estrutura dos dados e as performances dos modelos, conseguimos uma ótima separação dos clientes. Em termos de negócio conseguimos um ótimo desempenho, pois o cluster Insiders representa 20% da carteira de clientes da empresa e, além disso, esse cluster é responsável por 57% do faturamento anual da empresa, sendo que esses clientes possuem uma recência média de 9 dias com uma média de 220 produtos compras. 

# 6. Questões de Negócio

**1.** Quem são as pessoas elegíveis para participar do programa de Insiders?
- As pessoas elegíveis para participar do programa insiders, são os clientes do cluster 3. No arquivo data do repositório você encontrará as informações desse grupo.  As informações estão salvas em um arquivo .csv nomeado de customers_insiders.csv'

**2.** Quantos clientes farão parte do grupo?
- Farão parte do programa insiders 1140 clientes.

**3.** Quais são as principais características desses clientes?
|**PRINCIPAIS CARACTERÍSTICAS DOS CLIENTES DO CLUSTER INSIDERS**|
|-----------------------------------------------------------|
|*Percentual representativo:* 20.0% ;|
|*Média de Faturamento:* R$ 5050.0;|
|*Média de Recência de Compras:* 9.0 dias.|
|*Média de Produtos Comprados:* 220.0 produtos.|
|*Frequência de compra de produtos:* 0.08 produtos por dia|
|*Média de Devoluções:* 57.0 produtos.|

**4.** Qual a porcentagem de contribuição do faturamento, vinda do Insiders?

- Os clientes insiders contribuem com 56.97% no faturamento total.

**9.** Quais ações o time de marketing pode realizar para aumentar o faturamento?

-  Para manter os clientes insiders no Cluster insiders, podemos oferecer descontos, dar a oportunidade dos clientes visitar e conhecer toda a estrutura da empresa, dar premiações, dar brindes de datas comemorativas, oferecer tratamento especial e reservar os melhores produtos para esses clientes. 
-  Para os outros clusters podemos realizar campanhas de marketing para descontos e promoções para aumentar o faturamento. Explicar os benefícios do programa insiders e qual são os critérios para fazer parte.

# 7. Lições Aprendidas e Resumo Final

Nesse projeto, a principal lição aprendida foi o entendimento da aprendizagem não-supervisionada, o funcionamento dos modelos de clusterização e as técnicas de espaços de embedding. Ao longo desse projeto, percebi que desenvolver modelos para clusterização é bem desafiante, pois nessa situação, a forma como os dados estão distribuídos é MUITO relevante. 
<p>Para isso, existem técnicas para contornar esse problema. A primeira estratégia a ser abordada é a criação de novas features para tentar melhorar o espaço de dados original. No nosso problema, foram criadas 13 features para ocorrer a tentativa de uma melhor organização dos dados, entretanto, não houve tanto sucesso. O próximo passo foi utilizar técnicas de espaços de embedding, no caso, soluções topológicas como UMAP e T-SNE que usam técnicas de projeção de espaço, e também usamos as técnicas das Folhas das arvores de decisão para organizar melhor o espaço. Nessa  situação, conseguimos uma melhora pequena melhora nos espaços.</p>
<p>Com um espaço melhor definido, compreendemos o funcionamento dos modelos utilizados e como cada um poderia atuar da melhor forma possível sobre esses espaços a partir de suas métricas de distâncias e seus métodos de clusterização.</p>
Enfim, problemas de clusterização são bem difícieis de se trabalhar. Além disso, o espaço de dados que será clusterizado pode facilitar a clusterização ou pode dificultar muito mais.

# 8. Próximos Passos

- Estudo de outros modelos de clusterização para  melhorar as métricas de performance.
- Estudo de mais técnicas para organizar melhor o espaço de dados.
- Feature Engineering para criar features melhores e mais relevantes pata melhorar o espaço.
- Realizar um novo ciclo para responder as questões faltantes.
- Treino da equipe de marketing para utilizar o dashboard.
- Manutenção da infraestrutura da AWS
- Retreino do modelo periodicamente.

