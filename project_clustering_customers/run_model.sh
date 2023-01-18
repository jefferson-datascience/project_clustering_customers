data=$(date +%Y-%m-%dT%H:%M:%S)
path='/Users/Xcell/repositorio/projects/project_clustering_customers/project_clustering_customers'
path_env='/Users/Xcell/repositorio/projects/project_clustering_customers/.clustering/Scripts'


$path_env/papermill.exe $path/src/models/modelo_de_producao.ipynb $path/reports/modelo_de_producao_$data.ipynb
