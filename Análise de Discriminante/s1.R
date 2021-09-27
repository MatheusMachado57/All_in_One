library(tidyverse)
library(MASS)
require(htmltools)
library(caret)
library(mvnormtest)
library(klaR)

set.seed(12042021)
ind_treino = createDataPartition(iris$Species, p = 0.75, list = F)

treino <- iris[ ind_treino,]
teste  <- iris[-ind_treino,]

prop.table(table(iris$Species))

prop.table(table(treino$Species))
prop.table(table(teste$Species))

U = t(as.matrix(treino[,-5]))

mshapiro.test(U)

bartlett.test(treino[,-5])

(modelo1 = lda(Species~.,treino))