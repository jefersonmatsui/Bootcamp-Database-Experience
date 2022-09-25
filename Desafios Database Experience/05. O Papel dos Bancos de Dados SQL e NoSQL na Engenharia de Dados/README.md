O que é SQL?

SQL é a sigla para “Structured Query Language”, que significa, traduzindo para o português, “Linguagem de Consulta Estruturada”. Trata-se de uma linguagem de consulta a banco de dados relacionais.

Com o SQL você pode executar vários comandos para criar, alterar, gerenciar, consultar, etc no seu banco de dados.

Costumamos dizer que bancos SQL seguem uma modelagem relacional, pois estes se baseiam no fato de que todos seus dados sejam guardados em tabelas.


E NoSQL? O que é?

NoSQL (Not Only SQL) é o termo utilizado para banco de dados não relacionais de alto desempenho onde, geralmente, o SQL não é utilizado como linguagem de consulta.

O NoSQL foi criado para ter uma performance melhor e uma escalabilidade mais horizontal para suprir necessidades onde os bancos relacionais não são eficazes.

No geral, temos 5 tipos de bancos de dados NoSQL:

Documento
Os dados são armazenados como documentos. Os documentos podem ser descritos como dados no formato de chave-valor, como por exemplo, o padrão JSON.

Um exemplo de banco de dados neste formato é o MongoDB.

Colunas
Os dados são armazenados em linhas particulares de tabela no disco, podendo suportar várias linhas e colunas, além de permitir sub-colunas.

Um banco de dados dessa família, por exemplo, é o Cassandra.

Grafos
Os dados são armazenados na forma de grafos (vértices e arestas).

O Neo4j é um banco que utiliza grafos.

Chave-valor
Essa família de bancos NoSQL é a que aguenta a maior carga de dados, pois o conceito dela é que um determinado valor seja acessado através de uma chave identificadora única.

Um exemplo é o banco de dados Riak.



SQL vs NoSQL

O conceito de modelo relacional (SQL) se baseia no fato de que todos os dados sejam guardados em tabelas.

Ao modelo não-relacional (NoSQL) se aplica o conceito de schema: uma chave de valor é que é utilizada para recuperar valores, conjunto de colunas ou documentos.

Quais são as diferenças?

O SQL tem certa dificuldade em conciliar a demanda por escalabilidade. Quanto à escalabilidade do NoSQL, devemos levar em consideração a modelagem do sistema.

Do que adianta termos um sistema super simples e querermos utilizar o NoSQL apenas pela escalabilidade? Todo o ganho de performance seria perdido quando rodássemos a aplicação.

Um ponto forte do SQL é quanto à consistência das informações.

Já o NoSQL garante o último valor atualizado, isso se nenhuma atualização for realizada até o momento da consulta.

Quanto à segurança, ambos estão suscetíveis a ataques
