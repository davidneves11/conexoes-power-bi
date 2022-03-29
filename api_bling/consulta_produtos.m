let
    BlingCall = (pagina as number) =>
    let
        Request =
            Json.Document(
                Web.Contents(
                    "https://bling.com.br/",
                    [
                        RelativePath = "Api/v2/produtos/page="&Text.From(pagina)&"/json/", 
                        Query =
                        [
                            apikey = chave_api //parâmetro
                        ]
                    ]
                    )
                )
    in
        Request,
        // A linha abaixo cria uma lista que começa do numero 1 até o número da página informada
        Source = Table.FromList(List.Generate( () => 1 , each _ <= paginasProdutos, each _ +1), Splitter.SplitByNothing(), null, null, ExtraValues.Error), //paginasProdutos é o parâmetro
        //A função custimzada é invocada fazendo uma requisição linha a linha referente a cada número de página
        #"Invoked Custom Function" = Table.AddColumn(Source, "Registros", each BlingCall([Column1])),
        #"Colunas Removidas" = Table.RemoveColumns(#"Invoked Custom Function",{"Column1"}),
        #"Expanded {0}" = Table.ExpandRecordColumn(#"Colunas Removidas", "Registros", {"retorno"}, {"retorno"}),
        #"retorno Expandido" = Table.ExpandRecordColumn(#"Expanded {0}", "retorno", {"produtos"}, {"produtos"}),
        #"produtos Expandido" = Table.ExpandListColumn(#"retorno Expandido", "produtos"),
        #"produtos Expandido1" = Table.ExpandRecordColumn(#"produtos Expandido", "produtos", {"produto"}, {"produto"})
in
    #"produtos Expandido1"