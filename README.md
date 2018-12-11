# README

- Execução
  Após instalação do MongoDB, basta rodar o "bundle install" e executar com o "rails server" ou "rails s"

- Funcionamento
  É necessário criar um usuário para se autenticar na API e ter acesso a mesma.
  A API aliementa uma base de dados com frases extraidas do site "http://quotes.toscrape.com" a partir de tags informadas url: /quotes/{SEARCH_TAG},
  Para cada tag será inserido 10 registros a menos que esta faça parte de outras frases.

- Solução
  Foi criado um model de usuários para ser feita a autenticação na API e obter o token de acesso.
  A quotes.toscrap exibe um resultado de 10 registros por página, portanto a cada tag buscada, primeiro é verificado os registros na base de dados
  se esta busca nao satisfazer os 10 registros, é feita uma verificação e caso haja alguma frase que não esteja no nosso banco a mesma é importada.  