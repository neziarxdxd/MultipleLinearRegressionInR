data = read.csv("hprice.csv")
dataset<- read.csv("hprice.csv")

## converting Categorical dataset into dummy variable 
# dataset$State<- factor(dataset$State, levels= c("New York", "California", "Florida"), labels= c('1','2','3'))

## splitting data 

library(caTools)
set.seed(123)
split=sample.split(dataset$Y_PriceArea, SplitRatio = 0.6)
trainingSet<- subset(dataset, split==T)
testSet<- subset(dataset, split==F)

# feature scaling not required for lm function

# fitting linera regression to training set

regressor4<- lm(formula = Y_PriceArea~P_Lon+P_Lat+P_CntStores , data = trainingSet)
summary(regressor4)
## Exporting diffrent multiple Linear regression output
library(texreg)
texreg::htmlreg(list(regressor4),file='Linear regression output.doc')


## predicting the test set result by different modeling output
y_pred4<- predict(regressor4, newdata= testSet)
testSet$Predict4 <- y_pred4
## exporting testset data with predictions in different models 
write.csv(testSet, "Profit comparision of different model.csv")
getwd()

