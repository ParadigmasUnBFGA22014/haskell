module Main where 

import System.Console.ANSI

import Grafo (grafo,retorna_aresta,filtra_questoes_aresta,ver_questoes_aresta,ver_informacao_aresta,selec_sec)

startGame::Int -> IO()
startGame idStart = do

	putStr "voce esta no No "
	print idStart	
	putStrLn " "

	
	print (ver_informacao_aresta (retorna_aresta grafo idStart))
	putStrLn ""
	putStrLn "O que vc vai fazer? (digite um dos numeros)"
	putStrLn " "
	putStr (unlines(ver_questoes_aresta(filtra_questoes_aresta(retorna_aresta grafo idStart))))
	
	
	putStrLn ""
	putStrLn " "


	opcao <-readLn
	
	let aux=selec_sec(filtra_questoes_aresta(retorna_aresta grafo idStart)!!(opcao-1))
	let idStart=aux
	clearScreen

	if (opcao<100)then startGame idStart
		else putStrLn "Voce saiu do game :( "


main =do

	clearScreen 

	setTitle "Trabalho Haskell Paradigmas"
	

	putStrLn "Olá, vamos iniciar o Jogo!"
	putStrLn ""
	putStrLn "Voce pode sair do jogo a qualquer momento, basta digitar 101 e teclar enter. "
	putStrLn ""
	putStrLn "Qual eh o seu nome?"
	putStrLn ""
	nome <- getLine

	clearScreen
	putStrLn ("Ok "++nome++" Seja bem vindo(a)")
	putStrLn ""
	
	startGame 1
