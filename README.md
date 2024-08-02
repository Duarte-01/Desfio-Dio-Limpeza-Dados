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