data=$(date +%Y-%m-%dT%H:%M:%S)
path='/home/ubuntu/project_clustering_customers/project_clustering_customers'
path_env='/home/ubuntu/.pyenv/versions/pa005_insiders/bin

$path_env/papermill $path/src/models/modelo_de_producao.ipynb $path/reports/modelo_de_producao_$data.ipynb
