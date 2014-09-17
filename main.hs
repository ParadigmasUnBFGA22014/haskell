module Main where 

import Grafo (grafo,retorna_aresta,filtra_questoes_aresta,ver_questoes_aresta,ver_informacao_aresta,selec_sec)

--startGame:: Int-> IO()
--startGame idStart = do
	
--	putStrLn ""
--	opcao <-readLn
--	print(ver_informacao_aresta (retorna_aresta grafo (selec_sec(filtra_questoes_aresta(retorna_aresta grafo idStart)!!(opcao-1)))))
--	putStrLn ""
--	--(selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1)))   --retorna Id da proxima aresta
--	--idProx<-(selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1)))
	
--	putStrLn "Proximo No"
--	putStrLn "-------"
--	print (selec_sec(filtra_questoes_aresta(retorna_aresta grafo idStart)!!(opcao-1)))
--	putStrLn "-------"
	
--	print(ver_questoes_aresta(filtra_questoes_aresta(retorna_aresta grafo (selec_sec(filtra_questoes_aresta(retorna_aresta grafo idStart)!!(opcao-1))))))	
--	putStrLn ""
--	let idStart=selec_sec(filtra_questoes_aresta(retorna_aresta grafo idStart)!!(opcao-1))

--	putStrLn "O que vc vai fazer? (digite um dos numeros)"
--	putStrLn ""

--	if (opcao<100)then startGame idStart
--		else putStrLn "Stop "

startGame_2::Int -> IO()
startGame_2 idStart = do
	
	print(ver_informacao_aresta (retorna_aresta grafo idStart))
	putStrLn ""
	print(ver_questoes_aresta(filtra_questoes_aresta(retorna_aresta grafo idStart)))
	putStrLn "O que vc vai fazer? (digite um dos numeros)"
	opcao <-readLn
	let aux=selec_sec(filtra_questoes_aresta(retorna_aresta grafo idStart)!!(opcao-1))
	let idStart=aux

	if (opcao<100)then startGame_2 idStart
		else putStrLn "Stop "


main =do
	putStrLn "Olá, vamos iniciar o Jogo!"
	putStrLn ""
	putStrLn "Qual eh o seu nome?"
	putStrLn ""
	nome <- getLine
	putStrLn ("Ok "++nome++" Seja bem vindo(a)")
	
	
	startGame_2 1
	
	--print(ver_informacao_aresta (retorna_aresta grafo 2))
	--putStrLn ""

	--print(ver_questoes_aresta(filtra_questoes_aresta(retorna_aresta grafo 2)))
	--putStrLn "O que vc vai fazer? (digite um dos numeros)"
	--startGame 1


	--putStrLn ""
	--putStrLn $nome++" o que vc vai fazer? (digite um dos numeros)"
	--putStrLn ""
	
	--opcao <-readLn
	--print(ver_informacao_aresta (retorna_aresta grafo (selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1)))))
	--putStrLn ""
	----(selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1)))   --retorna Id da proxima aresta
	----idProx<-(selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1)))
	--print(ver_questoes_aresta(filtra_questoes_aresta(retorna_aresta grafo (selec_sec(filtra_questoes_aresta(retorna_aresta grafo 1)!!(opcao-1))))))	
	--putStrLn ""
	

