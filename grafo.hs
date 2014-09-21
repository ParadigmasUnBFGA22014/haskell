module Grafo(grafo,retorna_no,filtra_questoes_no,ver_questoes_no,ver_informacao_no,selec_sec)where

type Aresta = Int 
type Id = Int
type Informacao = String
type Alternativa = String
type No = ([(Aresta,Aresta,Alternativa)],Id,Informacao)
type Grafo = [No]

grafo :: [No]

grafo = [
		([(1,2,"(1) Onibus Lotado"), (1,3,"(2) Carona")], 1,"Voce mora no Goias e precisa ir para FGA, de que vc vai?"),
		([(2,4,"(1) Taxi"), (2,5,"(2) Espera outro Onibus"), (2,11,"(3) Moto taxi") ], 2, "O onibus quebrou, e agora o que voce faz?"),
		([(5,11,"(1) Moto Taxi"), (5,7,"(2) Esperar")], 5, "Como sempre, esta tendo engarrafametno do Valparaiso, o que voce faz?"),
		([(7,8,"(1) Integracao"), (7,9,"(2) Onibus da FGA"), (7,10,"(3) A pe")], 7, "Voce esta na Entrada Sul do Gama, como voce vai para a FGA?"),
		([(10,1,"Game Over")], 10, "Voce desmaiou na metado do caminho, por ser sedentario."),
		([(9,8,"(1) Integracao"), (9,10,"(2) A pe")], 9, "O onibus estava saindo e o motorista nao parou para voce. Tente outra maneira"),
		([(8,20,"FGA")], 8, "Boa opcao. apesar dos inumeros problemas voce conseguiu chegar na FGA a tempo!"),
		([(4,5,"(1) Espera outro Onibus"), (4,11,"(2) Moto taxi")], 4, "Cara, voce e um universitario, voce nao tem direnhiro nem para comer. Como voce passou no vestibular pensando assim?"),
		([(11,12,"(1) Desce e sai correndo"), (11,13,"(2) Explica a Situacao")], 11, "Opa! esta tendo uma blitz na entrada do gama e voce sabe que os documentos do veiculo estao atrasados, o que voce vai fazer?"),
		([(12,1,"Game Over")], 12, "Voce foi pego, e agora vai passar a noite na jaula."),
		([(13,8,"(1) Integracao"), (13,9,"(2) Onibus da FGA"), (13,10,"(3) A pe")], 13, "Os policiais te ouviram. Voce foi liberado, mas como voce vai chegar na FGA agora?"),
		([(3,2,"(1) Pegar um onibus"), (3,15,"(2) Ajuda a troca")], 3, "O hoje e o seu dia de sorte, o pneu furou, voce e um bom camarada?"),
		([(15,11,"(1) Moto Taxi"), (15,11,"(2) Esperar")], 15, "Mais uma mare de sorte. Houve um acidente, esta tudo parado, o que voce vai fazer?")
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












					



