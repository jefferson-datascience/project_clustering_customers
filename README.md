# Agrupamento dos Melhores Clientes da Empresa All in One Place

#### O objetivo deste projeto é realizar a clusterização de clientes por meio de aprendizagem de máquina não supervisionado.

#### This project was made by Jefferson Henirque Candido.


# 1. Problema de Negócio.

 A empresa All in One Place é um Outlet Multimarcas, ou seja, ela comercializa produtos de segunda linha de várias marcas a um preço menor, através de um e-commerce.
    Em um pouco mais de 1 ano de operação, o time de marketing percebeu que alguns clientes de sua base compram produtos mais caros e com uma certa alta frequência ,e consequentemente, acabam contribuindo com uma parcela significativa do faturamento da empresa.
    Baseado nessa percepção, o time de marketing vai lançar um programa de fidelidade para os melhores clientes da base, chamado Insiders. Todavia, o time não tem um conhecimento avançado em análise de dados para eleger os participantes do programa.
    Por esse motivo, o time de marketing requisitou ao time de dados uma seleção de clientes elegíveis ao programa, usando técnicas avançadas de manipulação de dados.


**O Desafio**
    Determinar quem são os clientes elegíveis para participar do programa Insiders. Em posse dessa lista, o time de Marketing fará uma sequência de ações personalizadas e exclusivas ao grupo, de modo a aumentar o faturamento e a frequência de compra.
    
### Planejamento de Solução

**Qual é a solução para esse problema?** A solução para esse problema é o desenvolvimento de um modelo de clusterização(aprendizado de máquina não-supervisionado) para encontrar um grupo com os melhores clientes.

**Como vai ser o produto final?**
    
    **i.** Dashboard no MetaBase atualizado todo dia 15 de todo mês por meio de uma insfraestrutura de Cloud Computing na AWS.
    **ii. Arquivo .csv com todos os clientes do cluster insiders.**
    **ii. Relatório com as questões de negócio respondidas.**
    

# 2. Business Assumptions.

### Atributos

|**Atributos** | **Descrição** |
|----------|-----------|

# 3. Estratégia de Solução

A estratégia para resolver esse problema foi:

**Etapa 00 - Coleta e Carregamento dos Dados:** Coleta de dados a partir de um arquivo .csv e estudo das variáveis.

**Etapa 01 - Descrição dos Dados:** Limpeza dos dados, checagem e preenchimento de valores nulos, mudança de naturaza das variáveis e estatística descritiva dos dados e breve estudos de outliers.

**Etapa 02 - Filtragem dos Dados:** Remoção de Dados desnecessário, filtragem de clientes que possuem somente faturamento positivo e remoção de outliers.

**Etapa 03 - Feature Engineering:** Criação de Variáveis para uma organização melhor dos espaços de dados.

**Etapa 04 - Análise Exploratória:** Investigação mais afunda dos dados, estudo do espaço de dados original, estudo de espaço embedding com UMAP, T-SNE e Trees Embedding. 

**Etapa 05 - Preparação dos Dados:** Redimensionamento da escala dos dados.

**Etapa 06 - Seleção das Features:** Análise do comportamento das features selecionadas sobre os espaços de embedding e o espaço de dados, e, escolha do melhor espaço para clusterização.

**Etapa 07 - Fine Tunning de Hiperparâmetro:** Escolha dos Modelos de Clusterização, no caso, K-Means, Gaussian Mixture Model, Hierarchical Clustering, DBSCAN e análise de performance dos modelo utilizando silhouette score. 

**Etapa 08 - Treinamento do Modelo:** Treinamento do modelo escolhido sobre os três espaços. 

**Etapa 09 - Análise dos Clusters:** Análise dos clusters determinados pelos modelos e a investigação dos cluster pela visão de negócio.

**Etapa 10 - Deploy do Modelo em Produção:** Desenvolvimento da infraestrutura na AWS desde a ligação da EC2 passando pela criação da S3 e depositando os dados transformados no banco de dados Postgres na RDS da Amazon. Elaboração do Dashboard no Metabase que consome os dados do Banco de Dados Postgres hospedados na RDS da Amazon.

# 4. Modelos de Machine Learning Utilizados

Para resolver esse problema, nós escolhemos os seguintes modelos:

    * K-Means
    * Hierarchical Clustering
    * Gaussian Mixture Model
    * DBSCAN
    
## Performance dos Modelos de Machine Learning

Para analisar a performance dos modelos de Machine Learning, nós utilizamos a silhouette score sobre cada espaço de dados para analisar a melhor performance. 


#### Espaço de Features

|**Número de Clusters** | 2       |     3   |    4    |    5    |     6   |     7   |
|**kMeans Model**       |0.685804 |0.628754 |0.531541 |0.519266 |0.490362 |0.500192 |
|**GMM Model**          |-0.009367|-0.226330|-0.121346|-0.117001|-0.147114|-0.183835|
|**Hierarchical Model** |0.652177 |0.622043 |0.544948 |0.445219 |0.435247 |0.398956 |
|**DBSCAN Model**       |0.510000 |0.000000 |0.000000 |0.000000 |0.000000 |0.000000 |


#### Espaço de Embeeding - Trees

|**Número de Clusters**|2|3|4|5|6|7|8|9|10|11|12|13|14|
|**kMeans Model**    |0.387748|0.420496|0.407888|0.410816|0.412654|0.445922|0.451943|0.478262|0.502843|0.511563|0.525579|0.539400|0.552435|
|**GMM Model**|0.387338|0.415050|0.279055|0.277089|0.298699|0.316698|0.345374|0.391680|0.407511|0.444450|0.457036|0.499144|0.492762|
|**Hierarchical Model**|0.353537|0.364492|0.374277|0.380910|0.405928|0.428638|0.439811|0.469397|0.476959|0.494094|0.499859|0.517916|0.528244|


#### Espaço de Embeeding - T-SNE

|**Número de Clusters** |2|3|4|5|6|7|8|9|10|11|12|13|14|
|**kMeans Model** |0.343229|0.387851|0.383945|0.365743|0.398486|0.409261|0.411761|0.415225|0.428772|0.434821|0.434122|0.431336|0.431794|
|**GMM Model** |0.326712|0.381288|0.296867|0.335003|0.357197|0.331231|0.282916|0.381790|0.279712|0.308954|0.350805|0.295413|0.390190|
|**Hierarchical Model** |0.325071|0.363674|0.352761|0.333878|0.311203|0.318458|0.353564|0.373879|0.401274|0.410461|0.416449|0.418348|0.419928|


#### Espaço de Embeeding - UMAP

|**Número de Clusters** |2|3|4|5|6|7|8|9|10|11|12|13|14|
|**kMeans Model**|0.427374|0.457138|0.455733|0.444487|0.453713|0.466439|0.492003|0.520514|0.532198|0.550515|0.555787|0.568117|0.541119|
|**GMM Model**|0.427377|0.342889|0.396329|0.420385|0.418542|0.408923|0.418259|0.458402|0.421660|0.442217|0.477680|0.475444|0.467722|
|**Hierarchical Model**|0.424543|0.399549|0.399572|0.437894|0.44673|0.453867|0.478580|0.490524|0.511983|0.533439|0.544080|0.554133|0.562982|





  

# 4. Top 3 Data Insights

**Hypothesis 01:**

**True/False.**

**Hypothesis 02:**

**True/False.**

**Hypothesis 03:**

**True/False.**




# 7. Business Results

# 8. Conclusions

# 9. Lessons Learned

# 10. Next Steps to Improve

# LICENSE

# All Rights Reserved - Comunidade DS 2022
