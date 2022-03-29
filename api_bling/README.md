# Conexão API Bling

**Bling** é uma **ERP** online para pequenas empresas e lojas online, onde possui uma *API* no qual podemos consultar inúmeras informações.

No [*site da documentação*](https://ajuda.bling.com.br/hc/pt-br/categories/360002186394-API-para-Desenvolvedores), encontramos tudo muito bem explicado sobre como podemos fazer requisições, mas nessa seção vou disponibilizar a consulta dos Produtos e dos Pedidos.

## Realizando a conexão

O primeiro passo será você conseguir a **chave da API** por conta da autenticação durante a requisição.

Feito isso, criei um parâmetro dentro do *Power Query* chamado `chave_api` onde armazenei a minha chave, pois pude reaproveitar para todas as consultas.

## Consultas

- ### Produtos

    Podemos consultar utilizando a **url** abaixo através da **conexão web** porém esse tipo de conexão apenas possibilita consultarmos os produtos da primeira página.

    `https://bling.com.br/Api/v2/produtos/json/&apikey={CHAVE_DA_API}`

    De forma dinâmica, podemos criar um parâmetro que armazena o número de páginas e atribuí-lo dentro da função de invocação criada.

    Crie uma *consulta nula* e abra o *Editor Avançado* para adicionar o código da função abaixo.

    [Consulta_produtos](https://github.com/davidneves11/conexoes-power-bi/blob/main/api_bling/consulta_produtos.m)

