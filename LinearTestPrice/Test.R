
# LOAD po ang mga data
dataset<- read.csv("hprice.csv")

library(caTools)
set.seed(123)

# find the correlation -> or hanapin ang mga may malaking factor bakit yun ang price ng isang bahay 
# using Heatmap or Scatter Plot

library("PerformanceAnalytics")
chart.Correlation(dataset, histogram=TRUE, pch=19)

library(psych)
corPlot(data, cex = 1.2)


## splitting data
split=sample.split(dataset$Y_PriceArea, SplitRatio = 0.6)
trainingSet<- subset(dataset, split==T)
# 20% for training
testSet<- subset(dataset, split==F)

regressor4<- lm(formula = Y_PriceArea~P_Lon+P_Lat+P_CntStores , data = trainingSet)
summary(regressor4)
## Exporting diffrent multiple Linear regression output

library(texreg)
texreg::htmlreg(list(regressor4),file='Linear regression output.doc')


## predicting the test set result by different modeling output
y_pred4<- predict(regressor4, newdata= testSet)
testSet$Predict4 <- y_pred4


## exporting testset data with predictions in different models 
write.csv(testSet, "Price comparision of different model.csv")
getwd()

