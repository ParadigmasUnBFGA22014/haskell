module Main where 

import System.Console.ANSI

import Grafo (grafo,retorna_no,filtra_alternativas_no,ver_alternativas_no,ver_informacao_no,selec_sec)

startGame::Int -> IO()
startGame idStart = do

	putStr "voce esta no No "
	print idStart	
	putStrLn " "

	
	print (ver_informacao_no (retorna_no grafo idStart))
	putStrLn ""
	putStrLn "O que vc vai fazer? (digite um dos numeros)"
	putStrLn " "
	putStr (unlines(ver_alternativas_no(filtra_alternativas_no(retorna_no grafo idStart))))
	
	
	putStrLn ""
	putStrLn " "


	opcao <-readLn
	
	let aux=selec_sec(filtra_alternativas_no(retorna_no grafo idStart)!!(opcao-1))
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
	
	startGame 0
