module Grafo(grafo,retorna_aresta,filtra_questoes_aresta,ver_questoes_aresta,ver_informacao_aresta,selec_sec)where

type Vertice=Int 
type Id=Int
type Informacao = String
type Questao = String
type Aresta =([(Vertice,Vertice,Questao)],Id,Informacao)
type Grafo =[Aresta]

grafo ::[Aresta]
grafo= [([(1,2,"(1) Carro"),(1,3,"(2) Jumento"),(1,4,"(3) Bus Lotado")],1,"Voce mora no goias e precisa ir para FGA, de que vc vai?"),
		([(2,6,"(1) Colocar uma corrente envolta do carro"),(2,6,"(2) Levar um cachorro e amarrar ele na porta do carro")],2,"Estao Roubando Estepe na FGA, o que voce vai fazer pra se proteger?"),
		 ([(3,1,"(1) Desisto, vou a pe"),(3,1,"(2) Nao vou a aula hoje"),(3,4,"(3) Desito, vou de bus")],3,"O Jumento impacou, e agora?"),
		 ([(6,2,"(1) OP 1"),(6,1,"(2) Op 2"),(6,4,"(3)Op 3")],6,"Deu certo")
		]

selec_prim (x,_,_)=x
selec_sec (_,x,_)=x
selec_ter (_,_,x)=x


retorna_aresta :: Grafo->Id -> Aresta
retorna_aresta ((a,b,c):xs) id
						|(b==id)= (a,b,c)
						|(b/=id)= retorna_aresta xs id  
						|otherwise =(a,b,c)

filtra_questoes_aresta :: Aresta -> [(Vertice,Vertice,Questao)]
filtra_questoes_aresta x = selec_prim x

ver_questoes_aresta :: [(Vertice,Vertice,Questao)]->[Questao]
ver_questoes_aresta [] = []
ver_questoes_aresta ((verticeA,verticeB,questao):xs)=questao:(ver_questoes_aresta xs)

ver_informacao_aresta :: Aresta ->Informacao
ver_informacao_aresta x=selec_ter x












					



