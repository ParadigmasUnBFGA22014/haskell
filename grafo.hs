module Grafo(grafo,retorna_no,filtra_questoes_no,ver_questoes_no,ver_informacao_no,selec_sec)where

type Aresta = Int 
type Id = Int
type Informacao = String
type Alternativa = String
type No = ([(Aresta,Aresta,Alternativa)],Id,Informacao)
type Grafo = [No]

grafo :: [No]

grafo = [
		([(0, 1, "(1) Luziania"), (0, 16, "(2) Ceilandia"), (0, 34, "(3) Santa Maria")], 0, "Voce precisa ir para a FGA, escolha uma cidade de partida."),
		
		([(1,2,"(1) Pegar um onibus Lotado"), (1,3,"(2) Pegar uma carona")], 1,"Voce mora em Luziania e precisa ir para a FGA."),
		([(2,4,"(1) Chamar um taxi"), (2,5,"(2) Esperar outro Onibus"), (2,11,"(3) Chamar um moto taxi") ], 2, "O onibus quebrou."),
		([(3,2,"(1) Pegar um onibus"), (3,15,"(2) Ajudar a trocar")], 3, "O hoje e o seu dia de sorte, o pneu furou, voce e um bom camarada?"),		
		([(4,5,"(1) Esperar outro onibus"), (4,11,"(2) Chamar um moto taxi")], 4, "Cara, voce e um universitario, voce nao tem direnhiro nem para comer. Como voce passou no vestibular pensando assim?"),
		([(5,11,"(1) Chamar um moto taxi"), (5,7,"(2) Esperar")], 5, "Como sempre, esta tendo engarrafamento do Valparaiso."),
		--No 6 ?
		([(7,8,"(1) Pegar o Integracao"), (7,9,"(2) Pegar o onibus da FGA"), (7,10,"(3) ir a pe")], 7, "Voce esta na Entrada Sul do Gama."),
		([(8,20,"(1) Ir para FGA!")], 8, "Boa opcao. apesar dos inumeros problemas voce conseguiu chegar na FGA a tempo!"),
		([(9,8,"(1) Pegar o Integracao"), (9,10,"(2) Ir a pe")], 9, "O onibus estava saindo e o motorista nao parou para voce. Tente outra maneira."),
		([(10,0,"Game Over!  Digite 1 para reiniciar.")], 10, "Voce desmaiou na metado do caminho, por ser sedentario."),
		([(11,12,"(1) Descer e sair correndo"), (11,13,"(2) Explicar a Situacao")], 11, "Opa! Esta tendo uma blitz na entrada do gama e voce sabe que os documentos do veiculo estao atrasados."),
		([(12,0,"Game Over! Digite 1 para reiniciar.")], 12, "Voce foi pego, e agora vai passar a noite na jaula."),
		([(13,8,"(1) Ir de integracao"), (13,9,"(2) Pegar o onibus da FGA"), (13,10,"(3) ir a pe")], 13, "Os policiais te ouviram. Voce foi liberado, mas como voce vai chegar na FGA agora?"),
		--No 14?
		([(15,11,"(1) Chamar um moto taxi"), (15,11,"(2) Esperar")], 15, "Mais uma mare de sorte. Houve um acidente, esta tudo parado."),
		
		--A partir daqui é ceilandia
		([(16,17,"(1) Ir de carro"), (16,18,"(2) Ir de moto"), (16,19,"(3) Ir de onibus")], 16,"Voce mora na Ceilandia, de que voce vai?"),
		([(17,18,"(1) Ir de moto"), (16,19,"(2) Ir de onibus"), (16,20,"(3) Nao vai mais :(")], 17,"Ops! Ao sair da garagem roubaram seu carro!"),
		([(18,21,"(1) Subornar com R$ 10,00"), (18,22,"(2) Acelerar e Fugir"), (18,23,"(3) Deixar moto ser apreendida")], 18,"Voce foi parado pela policia, porque nao estava usando capacete e nao esta com os documentos da moto!"),
		([(19,27,"(1) Dar Lugar, e ir para o fundo do onibus"), (19,28,"(2) Fingir estar dormindo")], 19,"Voce consegue pegar um onibus meio vazio e sentar nas cadeiras na frente, porem, entra uma velhinha!"),
		([(20,0,"(1) Game Over! Digite 1 para reiniciar.")], 20,"Voce perdeu por nao conseguir ir para a FGA!"),
		([(21,24,"(1) Aumentar suborno para R$ 15,00"), (21,25,"(2) Esquecer suborno e tentar outra negociacao"), (21,23,"(3) Deixar moto ser apreendida")], 21,"Voce quase conseguiu, o policial pediu mais R$ 5,00 para tudo ficar certo!"),
		([(22,0,"(1) Game Over! Digite 1 para reiniciar.")], 22,"Ops! Ao tentar escapar o policial te deu um tiro, e voce caiu morto no chao!"),
		([(23,19,"(1) Ir de onibus"), (23,26,"(2) Voltar pra casa")], 23,"O policial prendeu sua moto e te deixou, o que voce vai fazer agora?"),
		([(24,44,"(1) Entrar na FGA!")], 24,"Sucesso! Com todo esse dinheiro o policial deixou voce passar, e voce consegui chegar a FGA!"),
		([(25,20,"(1) Ir Preso!")], 25,"Que mancada! O policial fica furioso e te prende por tentativa de suborno!"),
		([(26,20,"(1) Voltar pra casa")], 26,"Voce estava andando e foi assaltado, levaram tudo!"),
		([(27,29,"(1) Continuar no onibus"), (27,20,"(2) Descer do onibus")], 27,"O onibus foi assaltado e levaram todo dinheiro e pertences de que estava na frente, voce escapou!"),
		([(28,31,"(1) Continuar no onibus"),(28,26,"(2) Descer do onibus")], 28,"O onibus foi assaltado e roubaram todos que estavam na frente, levaram ate seus tenis!"),
		([(29,30,"(1) Esperar proximo"),(29,10,"(2) Ir andando")], 29,"O onibus quebrou faltando apenas 5km para a FGA!"),
		([(30,20,"(1) Entrar na FGA")], 30,"O proximo onibus demorou 1h, mais como voce e preparado saiu cedo de casa, e conseguiu chegar na FGA!"),
		([(31,32,"(1) Entrar na FGA")], 31,"Voce conseguiu chegar na FGA decalco!"),
		([(32,33,"(1) Entrar na FGA assim mesmo"), (32,20,"(2) Ir para o hospital")], 32,"Voce pegou uma doenca por andar descalco no estacionamento da FGA e nao conseguiu entrar!"),
		([(33,0,"(1) Game Over!")], 33,"Sua doenca pirou e voce morreu antes de conseguir entrar na FGA!")

		--A partir daqui é Santa Maria
		([(34,35,"(1) De Onibus."),(34,36,"(2) De Carro."),(34,37,"(3) De Bike."),(34,38,"(4) De Carroca.")],34,"Voce mora em Santa Maria, como vc vai para FGA?"),
		([(35,39,"(1) Pegar um Taxi."),(35,40,"(2) Fazer respiracao boca a boca na vaca e salvar ela."),(2,4,"(3) Voltar para casa e pegar a Bike.")],35,"O motorista atropelou uma vaca sagrada e esta sendo linxado por indianos."),
		([(36,39,"(1) Abandonar o carro e pegar um taxi."),(36,42,"(2) Abandonar o carro e ir a pe mesmo.")],36,"O pneu furou e voce esta sem Estepe."),
		([(37,38,"(1) Pegar uma carona numa carroca."),(37,41,"(2) Roubar a bicicleta de uma crianca.")],37,"Voce foi assaldato por um bandido cego."),
		([(38,43,"(1) Puxar a carroca no braco."),(38,42,"(2) Abandonar e ir a pe para FGA.")],38,"O cavalo se soltou e correu atras de uma egua "),
		([(39,44,"(1) Sequestrar o taxi e ir para FGA. "),(39,42,"(2) Pular do carro em movimento e ir andando.")],39,"Voce esta na metade do caminho e viu que esta sem dinheiro."),
		([(40,44,"(1) Correr dos indianos e vai a pe para FGA."),(40,42,"(2) Ordenar que eles o carreguem ate a FGA.")],40,"Os indianos estao te adorando pensando que voce eh o deus shiva."),
		([(41,42,"(1) Correr bem rapido e vai a pe para FGA."),(41,2,"(2) Correr bem rapido e entra no primeiro onibus que voce ver.")],41,"O pai da crianca eh um negao bombado de 2 metros de altura e esta muito bravo. "),
		([(42,44,"(1) Amarrar sua toca no pe e vai andando."),(42,44,"(2) Ir pulando de um pe so")],42,"A sola do seu sapato soltou e o asfalto esta muito quente."),	
		([(43,42,"(1) Abandonar e ir a pe para FGA."),(43,41,"(2) Roubar a bicicleta de uma crianca e ir para FGA.")],43,"A carroca desmontou."),
		([(44,0,"Game Over! Digite 1 para reiniciar.")],44,"A FGA esta fechada, hoje eh domingo, voce confundiu os dias =(")
		]

selec_prim (x,_,_) = x
selec_sec (_,x,_) = x
selec_ter (_,_,x) = x


retorna_no :: Grafo->Id -> No
retorna_no ((a,b,c):xs) id
						|(b == id) = (a,b,c)
						|(b /= id) = retorna_no xs id  
						|otherwise = (a,b,c)

filtra_questoes_no :: No -> [(Aresta,Aresta,Alternativa)]
filtra_questoes_no x = selec_prim x

ver_questoes_no :: [(Aresta,Aresta,Alternativa)] -> [Alternativa]
ver_questoes_no [] = []
ver_questoes_no ((arestaA,arestaB,alternativa):xs) = alternativa:(ver_questoes_no xs)

ver_informacao_no :: No -> Informacao
ver_informacao_no x = selec_ter x
