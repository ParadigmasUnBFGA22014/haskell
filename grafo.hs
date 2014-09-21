module Grafo(grafo,retorna_no,filtra_questoes_no,ver_questoes_no,ver_informacao_no,selec_sec)where

type Aresta = Int 
type Id = Int
type Informacao = String
type Alternativa = String
type No = ([(Aresta,Aresta,Alternativa)],Id,Informacao)
type Grafo = [No]

grafo :: [No]

grafo = [
		([(0, 1, "(1) Entorno"), (0, 16, "(2) Ceilandia")], 0, "Voce precisa ir para a FGA, escolha sua localidade"),
		([(1,2,"(1) Onibus Lotado"), (1,3,"(2) Carona")], 1,"Voce mora no Goias, de que voce vai?"),
		([(2,4,"(1) Taxi"), (2,5,"(2) Espera outro Onibus"), (2,11,"(3) Moto taxi") ], 2, "O onibus quebrou, e agora o que voce faz?"),
		([(5,11,"(1) Moto Taxi"), (5,7,"(2) Esperar")], 5, "Como sempre, esta tendo engarrafametno do Valparaiso, o que voce faz?"),
		([(7,8,"(1) Integracao"), (7,9,"(2) Onibus da FGA"), (7,10,"(3) A pe")], 7, "Voce esta na Entrada Sul do Gama, como voce vai para a FGA?"),
		([(10,0,"(1) Game Over")], 10, "Voce desmaiou na metado do caminho, por ser sedentario."),
		([(9,8,"(1) Integracao"), (9,10,"(2) A pe")], 9, "O onibus estava saindo e o motorista nao parou para voce. Tente outra maneira"),
		([(8,0,"Entrar na FGA")], 8, "Boa opcao. apesar dos inumeros problemas voce conseguiu chegar na FGA a tempo!"),
		([(4,5,"(1) Espera outro Onibus"), (4,11,"(2) Moto taxi")], 4, "Cara, voce e um universitario, voce nao tem direnhiro nem para comer. Como voce passou no vestibular pensando assim?"),
		([(11,12,"(1) Desce e sai correndo"), (11,13,"(2) Explica a Situacao")], 11, "Opa! esta tendo uma blitz na entrada do gama e voce sabe que os documentos do veiculo estao atrasados, o que voce vai fazer?"),
		([(12,0,"Game Over")], 12, "Voce foi pego, e agora vai passar a noite na jaula."),
		([(13,8,"(1) Integracao"), (13,9,"(2) Onibus da FGA"), (13,10,"(3) A pe")], 13, "Os policiais te ouviram. Voce foi liberado, mas como voce vai chegar na FGA agora?"),
		([(3,2,"(1) Pegar um onibus"), (3,15,"(2) Ajuda a troca")], 3, "O hoje e o seu dia de sorte, o pneu furou, voce e um bom camarada?"),
		([(15,11,"(1) Moto Taxi"), (15,11,"(2) Esperar")], 15, "Mais uma mare de sorte. Houve um acidente, esta tudo parado, o que voce vai fazer?"),
		--A partir daqui é ceilandia
		([(16,17,"(1) Ir de carro"), (16,18,"(2) Ir de moto"), (16,19,"(3) Ir de onibus")], 16,"Voce mora na Ceilandia, de que voce vai?"),
		([(17,18,"(1) Ir de moto"), (16,19,"(2) Ir de onibus"), (16,20,"(3) Nao vai mais :(")], 17,"Ops! Ao sair da garagem roubaram seu carro, o que voce vai fazer?"),
		([(18,21,"(1) Subornar com R$ 10,00"), (18,22,"(2) Acelerar e Fugir"), (18,23,"(3) Deixar moto ser apreendida")], 18,"Voce foi parado pela policia, porque estava usando capacete e nao esta com os documentos da moto!"),
		([(21,24,"(1) Aumentar suborno para R$ 15,00"), (21,25,"(2) Esquecer suborno e tentar outra negociacao"), (21,23,"(3) Deixar moto ser apreendida")], 21,"Voce quase conseguiu, o policial pediu mais R$ 5,00 para tudo ficar certo!"),
		([(22,20,"(1) Game Over!")], 22,"Ops! Ao tentar escapar o policial te deu um tiro, e voce caiu morto no chao!"),
		([(24,0,"(1) Entrar na FGA!")], 24,"Sucesso! Com todo esse dinheiro o policial deixou voce passar, e voce consegui chegar a FGA!"),
		([(25,20,"(1) Ir Preso!")], 25,"Que mancada! O policial fica furioso e te prende por tentativa de suborno!"),
		([(23,19,"(1) Ir de onibus"), (23,26,"(2) Voltar pra casa")], 23,"O policial prendeu sua moto e te deixou, o que voce vai fazer agora?"),
		([(26,20,"(1) Voltar pra casa")], 26,"Voce estava andando e foi assaltado, levaram tudo, o que voce vai fazer?"),
		([(19,27,"(1) Dar Lugar, e ir para o fundo do onibus"), (19,28,"(2) Fingir estar dormindo")], 19,"Voce consegue pegar um onibus meio vazio e sentar nas cadeiras na frente, porem, entra uma velhinha, o que voce vai fazer?"),
		([(27,29,"(1) Continuar no onibus"), (27,20,"(2) Descer do onibus")], 27,"O onibus foi assaltado e levaram todo dinheiro e pertences de que estava na frente, voce escapou!"),
		([(29,30,"(1) Esperar proximo"),(29,10,"(2) Ir andando")], 29,"O onibus quebrou faltando apenas 5km para a FGA, o que voce vai fazer?"),
		([(30,0,"(1) Entrar na FGA")], 30,"O proximo onibus demorou 1h, mais como voce e preparado saiu cedo de casa, e conseguiu chegar na FGA!"),
		([(28,31,"(1) Continuar no onibus"),(28,26,"(2) Descer do onibus")], 28,"O onibus foi assaltado e roubaram todos que estavam na frente, levaram ate seus tenis, o que voce vai fazer?"),
		([(31,32,"(1) Entrar na FGA")], 31,"Voce conseguiu chegar na FGA decalco, o que voce vai fazer?"),
		([(32,33,"(1) Entrar na FGA assim mesmo"), (32,20,"(1) Ir para o hospital")], 32,"Voce pegou uma doenca por andar descalco no estacionamento da FGA e nao conseguiu entrar, o que voce vai fazer?"),
		([(33,20,"(1) Game Over!")], 33,"Sua doenca pirou e voce morreu antes de conseguir entrar na FGA!"),
		([(20,0,"(1) Game Over!")], 20,"Voce perdeu por nao conseguir ir para a FGA!")
		]

--grafo = [
--			([(1,2,"(1) De Onibus."),(1,3,"(2) De Carro."),(1,4,"(3) De Bike."),(1,5,"(4) De Carroca.")],1,"Voce mora em Santa Maria, como vc vai para FGA?"),
--			([(2,6,"(1) Pegar um Taxi."),(2,7,"(2) Fazer respiracao boca a boca na vaca e salvar ela."),(2,4,"(3) Voltar para casa e pegar a Bike.")],2,"O motorista atropelou uma vaca sagrada e esta sendo linxado por indianos."),
--			([(3,6,"(1) Abandonar o carro e pegar um taxi."),(3,9,"(2) Abandonar o carro e ir a pe mesmo.")],3,"O pneu furou e voce esta sem Estepe."),
--			([(4,5,"(1) Pegar uma carona numa carroca."),(4,8,"(2) Roubar a bicicleta de uma crianca.")],4,"Voce foi assaldato por um bandido cego."),
--			([(5,10,"(1) Puxar a carroca no braco."),(5,9,"(2) Abandonar e ir a pe para FGA.")],5,"O cavalo se soltou e correu atras de uma egua "),
--			([(6,11,"(1) Sequestrar o taxi e ir para FGA. "),(6,9,"(2) Pular do carro em movimento e ir andando.")],6,"Voce esta na metade do caminho e viu que esta sem dinheiro."),
--			([(7,11,"(1) Correr dos indianos e vai a pe para FGA."),(7,9,"(2) Ordenar que eles o carreguem ate a FGA.")],7,"Os indianos estao te adorando pensando que voce eh o deus shiva. "),
--			([(8,9,"(1) Correr bem rapido e vai a pe para FGA."),(8,2,"(2) Correr bem rapido e entra no primeiro onibus que voce ver.")],8,"O pai da crianca eh um negao bombado de 2 metros de altura e esta muito bravo. "),
--			([(9,11,"(1) Amarrar sua toca no pe e vai andando."),(9,11,"(2) Ir pulando de um pe so")],9,"A sola do seu sapato soltou e o asfalto esta muito quente. "),	
--			([(10,9,"(1) Abandonar e ir a pe para FGA."),(10,8,"(2) Roubar a bicicleta de uma crianca e ir para FGA.")],10,"A carroca desmontou. "),
--			([(11,1,"Digite 1 para voltar para Casa")],11,"A FGA esta fechada, hoje eh domingo, voce confundiu os dias =(")

--		]
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
