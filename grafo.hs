module Grafo(grafo,retorna_no,filtra_questoes_no,ver_questoes_no,ver_informacao_no,selec_sec)where

type Aresta=Int 
type Id=Int
type Informacao = String
type Questao = String
type No =([(Aresta,Aresta,Questao)],Id,Informacao)
type Grafo =[No]

grafo ::[No]
grafo= [([(1,2,"(1) Carro"),(1,3,"(2) Jumento"),(1,4,"(3) Bus Lotado")],1,"Voce mora no goias e precisa ir para FGA, de que vc vai?"),
		([(2,6,"(1) Colocar uma corrente envolta do carro"),(2,6,"(2) Levar um cachorro e amarrar ele na porta do carro")],2,"Estao Roubando Estepe na FGA, o que voce vai fazer pra se proteger?"),
		 ([(3,1,"(1) Desisto, vou a pe"),(3,1,"(2) Nao vou a aula hoje"),(3,4,"(3) Desito, vou de bus")],3,"O Jumento impacou, e agora?"),
		 ([(6,2,"(1) OP 1"),(6,1,"(2) Op 2"),(6,4,"(3)Op 3")],6,"Deu certo")
		]

selec_prim (x,_,_)=x
selec_sec (_,x,_)=x
selec_ter (_,_,x)=x


retorna_no :: Grafo->Id -> No
retorna_no ((a,b,c):xs) id
						|(b==id)= (a,b,c)
						|(b/=id)= retorna_no xs id  
						|otherwise =(a,b,c)

filtra_questoes_no :: No -> [(Aresta,Aresta,Questao)]
filtra_questoes_no x = selec_prim x

ver_questoes_no :: [(Aresta,Aresta,Questao)]->[Questao]
ver_questoes_no [] = []
ver_questoes_no ((arestaA,arestaB,questao):xs)=questao:(ver_questoes_no xs)

ver_informacao_no :: No ->Informacao
ver_informacao_no x=selec_ter x












					



