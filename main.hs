module Main where 

import Grafo (grafo,retorna_aresta,filtra_questoes_aresta,ver_questoes_aresta,ver_informacao_aresta,selec_sec)

--imprimeQuestoes ::[String]
--imprimeQuestoes (a:xs)= putStrLn a

main =do
	putStrLn "Olá, vamos iniciar o Jogo!"
	putStrLn "Qual eh o seu nome?"
	nome <- getLine
	putStrLn ("Ok "++nome++" Seja bem vindo(a)")
	
	print(ver_informacao_aresta (retorna_aresta grafo 1))
	putStrLn ""
	putStrLn $nome++" o que vc faz? (digite um dos numeros)"
	putStrLn ""
	print(ver_questoes_aresta(filtra_questoes_aresta(retorna_aresta grafo 1)))
	putStrLn ""
	opcao <-readLn
	print(ver_informacao_aresta (retorna_aresta grafo (selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1)))))
	putStrLn ""
	--(selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1)))   --retorna Id da proxima aresta
	--idProx<-(selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1)))
	print(ver_questoes_aresta(filtra_questoes_aresta(retorna_aresta grafo (selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1))))))	
	putStrLn ""
	

