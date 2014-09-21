module Grafo(grafo,retorna_no,filtra_questoes_no,ver_questoes_no,ver_informacao_no,selec_sec)where

type Aresta = Int 
type Id = Int
type Informacao = String
type Alternativa = String
type No = ([(Aresta,Aresta,Alternativa)],Id,Informacao)
type Grafo = [No]

grafo :: [No]

grafo = [
		([(0, 1, "(1) Luziania"), (0, 16, "(2) Ceilandia")], 0, "Voce precisa ir para a FGA, escolha sua localidade."),
		([(1,2,"(1) Pegar um onibus Lotado"), (1,3,"(2) Pegar uma carona")], 1,"Voce mora em Luziania e precisa ir para a FGA."),
		([(2,4,"(1) Chamar um taxi"), (2,5,"(2) Esperar outro Onibus"), (2,11,"(3) Chamar um moto taxi") ], 2, "O onibus quebrou."),
		([(5,11,"(1) Chamar um moto taxi"), (5,7,"(2) Esperar")], 5, "Como sempre, esta tendo engarrafamento do Valparaiso."),
		([(7,8,"(1) Pegar o Integracao"), (7,9,"(2) Pegar o onibus da FGA"), (7,10,"(3) ir a pe")], 7, "Voce esta na Entrada Sul do Gama."),
		([(10,1,"Game Over")], 10, "Voce desmaiou na metado do caminho, por ser sedentario."),
		([(9,8,"(1) Pegar o Integracao"), (9,10,"(2) Ir a pe")], 9, "O onibus estava saindo e o motorista nao parou para voce. Tente outra maneira."),
		([(8,20,"FGA")], 8, "Boa opcao. apesar dos inumeros problemas voce conseguiu chegar na FGA a tempo!"),
		([(4,5,"(1) Esperar outro onibus"), (4,11,"(2) Chamar um moto taxi")], 4, "Cara, voce e um universitario, voce nao tem direnhiro nem para comer. Como voce passou no vestibular pensando assim?"),
		([(11,12,"(1) Descer e sair correndo"), (11,13,"(2) Explicar a Situacao")], 11, "Opa! Esta tendo uma blitz na entrada do gama e voce sabe que os documentos do veiculo estao atrasados."),
		([(12,1,"Game Over")], 12, "Voce foi pego, e agora vai passar a noite na jaula."),
		([(13,8,"(1) Ir de integracao"), (13,9,"(2) Pegar o onibus da FGA"), (13,10,"(3) ir a pe")], 13, "Os policiais te ouviram. Voce foi liberado, mas como voce vai chegar na FGA agora?"),
		([(3,2,"(1) Pegar um onibus"), (3,15,"(2) Ajudar a trocar")], 3, "O hoje e o seu dia de sorte, o pneu furou, voce e um bom camarada?"),
		([(15,11,"(1) Chamar um moto taxi"), (15,11,"(2) Esperar")], 15, "Mais uma mare de sorte. Houve um acidente, esta tudo parado."),
		([(16,17,"(1) Ir de carro"), (16,18,"(2) Ir de onibus"), (16,19,"(3) Ir de Moto")], 16,"Voce mora na Ceilandia, de que voce vai?"),
		([(17,18,"(1) Ir de onibus"), (16,19,"(2) Ir de moto"), (16,20,"(3) Nao vai mais :(")], 17,"Ops! Ao sair da garagem roubaram seu carro, o que voce vai fazer?"),
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












					



