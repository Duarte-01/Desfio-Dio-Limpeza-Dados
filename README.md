# Desfio-Dio-Limpeza-Dados
repositório do desafio de limpeza e transformação de dados utilizando o power BI

O projeto foi iniciado criando uma instância de um banco de dados PostgreSQL no Render,
e conectado ao DBeaver para rodar os scripts sql, após isso o banco de dados foi conectado
ao power BI

# Passos feitos de limpeza e transformação dos dados

1. Remoção de tabelas de consultas após importar o banco de dados para o power BI que eram desnecessárias

2. Alterado o tipo de dado da coluna "Salary" na tabela employee para decimal fixo por se tratar de valores monetários

3. Alterado nome de colunas em comum com outras tabelas apenas para fácil identificação

4. Alterada linha na coluna de "hours" na tabela "works_on" de 0 para 8 horas, pois 0 não faz sentido

5. Remoção da coluna "mint" na tabela employee por ser desnecessária

6. a coluna "adress" foi dividida em 4 colunas por delimitador gerando "street", "city", "state", "house_number" 

7. ajustes nas linhas das colunas com substituição de valores nas colunas "state" e "house_number" para fazerem sentido

8. remoção da coluna "lname" pra ficar em um só coluna "collaborator_name" 

9. mescla de consultas realizada na tabela employee e departament nas colunas "dno" e "dnumber" com o intuito de mostrar o nome do departamento em que o colaborador trabalha

10. mescla de consultas realizada na tabela employee entre ela mesma entre as colunas "super_ssn" e "ssn" para mostrar o nome do gerente de cada colaborador 

11. mescla de consultas realizada na tabela department e dpt_location para gerar o par chave único departamento e localização

# Explicações entre mescla de consultas e combinação de consultas

A mescla de consultas no Power BI é usada para unificar informações de duas tabelas com base em uma coluna comum, semelhante a um JOIN no SQL. Isso permite combinar dados relacionados de diferentes tabelas em uma única visualização de dados. Por exemplo, ao mesclar as tabelas employee, conseguimos relacionar cada empregado com seu respectivo gerente, trazendo informações valiosas sobre ambos.

Por outro lado, a combinação de consultas é utilizada para agrupar todas as colunas de duas tabelas em uma única tabela, de forma sequencial, semelhante a um UNION no SQL. Isso é útil para consolidar dados que possuem a mesma estrutura de colunas, permitindo uma visualização mais enxuta dos dados.

No caso específico das tabelas department e dept_location, a combinação de consultas não seria adequada, pois o objetivo era gerar um par chave único de departamento e localização. A combinação apenas concatenaria as linhas das duas tabelas, sem estabelecer a relação necessária entre departamentos e suas respectivas localizações. A mescla de consultas, por outro lado, permite unir essas tabelas com base em uma coluna comum, criando a chave única desejada e preservando a integridade dos dados relacionados.

Essa versão detalha um pouco mais as funcionalidades e propósitos de cada técnica, além de explicar claramente por que a mescla foi a abordagem correta para o seu caso específico.






