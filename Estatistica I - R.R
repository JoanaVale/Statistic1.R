
##################################################################################
###                                Estat�stica  I                              ###
###                          Joana Andreia Machado Vale                        ###
###                                  Maio 2020                                 ###
##################################################################################


######################### Principais tipos de amostras ###########################

### Aleat�ria

amostra = sample(c(0,1), 150, replace = TRUE, prob=c(0.5,0.5))
amostra

# Tamanho da amostra: de 1 e de 0
length(amostra[amostra==1])
length(amostra[amostra==0])


# Tamanho da amostra das base de dados IRIS
amostrairis = iris[amostra==1,]
dim(amostrairis)

# Para fixar:
set.seed(2345)
sample(c(1000), 1)



###  Estratificada

library("sampling")

# Saber a propor��o do estrato �:  ( N�elementos da sec��o / N� total ) * 100  (D� O VALOR DO SIZE)
# method="srswor" -  QUER DIZER QUE N�O H� REPOSI��O


# Dase da dados IRIS:
amostrairis2=strata(iris,c("Species"),size=c(25,25,25), method="srswor")
summary(amostrairis2)


# Dase de dados Infert:
amostra=strata(infert,c("education"),size=c(5,48,47), method="srswor")
summary(amostra)



### Sistem�tica

library("TeachingSampling")

amostra = S.SY(150, 10)
amostra

amostrairis = iris[amostra,]
amostrairis



################ Medidas de Centralidade e Varibilidade #####################

jogadores = c(40000,18000,12000,250000,30000,140000,300000,40000,800000)

# M�dia:
mean(jogadores)

# Mediana:
median(jogadores)

# Quartis:
quartis  = quantile(jogadores)
quartis

quartis[4]                       # SE QUISER apenas O 3� QUARTIL

# Desvio Pad�o:
sd(jogadores)

# Resumo dos dados
summary(jogadores)



######################## Distribui��o Binomial ############################
 
# dbinom  -> encontrar a probabilidade
# pbinom  -> valor acumulado



# Qual a probalidade de lan�ar uma moeda 5 vezes e sair 3 vezes cara?
dbinom(3,5,0.5)

# Qual a probalidade de passar por 4 sinais de 4 tempos cada e existir 0,1,2,3 ou 4 sinais verdes?
dbinom(0,4,0.25) # 0
dbinom(1,4,0.25) # 1
dbinom(2,4,0.25) # 2
dbinom(3,4,0.25) # 3
dbinom(4,4,0.25) # 4

pbinom(4,4,0.25) # � igual a 1 porque englobe o espa�o amostral todo

# Qual a probalidade de acertar 7 quest�es, numa prova de 12 quest�es e cada uma tem 4 alternativas?
dbinom(7,12,0,25)




########################  Distribui��o Normal  ############################

# Se a m�dia = 8 e o desvio-padr�o = 2. 

# Queremos saber qual � a probabilidade de obter um objeto com menos 6 kg.
pnorm(6,8,2) # < 6kg

pnorm(6,8,2, lower.tail=F)  # > 6kg

# Queremos saber qual � a probabilidade de obter um objeto com menos 8 kg e com mais de 10 kg.
pnorm(6,8,2) + pnorm(10,8,2, lower.tail=F)

# Queremos saber qual � a probabilidade de obter um objeto com mais de 8 kg, mas com menos de 10kg.
pnorm(10,8,2) - pnorm(8,8,2, lower.tail=F)
1 - ( pnorm(8,8,2) + pnorm(10,8,2, lower.tail=F))



# Criar uma amostra normal aleat�ria:
x = rnorm(100)
x

#Gr�fico da distribui��o normal:
qqnorm(x)
qqline(x)

# Perceber se existe normalidade atrav�s do teste de Shapiro-Wilk:
shapiro.test(x) 




########################  Distribui��o T-Student  ############################

# Qual � a probabilidade de pegar num objeto com menos de 80h, se a m�dia � de 75. Existe 9 objetos e um desvio padr�o de 10. 
# t = 1.5  # N-1 = 9-1 = 8

pt(1.5, 8) # � ESQUERDA

pt(1.5,8,lower.tail=F)  # � DIREITA