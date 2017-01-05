Diamond Prediction Project Presentation
========================================================
author: Adham
date: January  04, 2017
autosize: true

Overview
========================================================


The Developled shiny app allows the user to enter the diamond in question properites
and it then predicts the price of the diamond, the app uses a machine learning model based on glm cross-validated on the diamond dataset obtained from gglplot2

Algorithm
========================================================


```r
library(caret)
library(ggplot2)
data(diamonds)

model_glm <- train(price~carat+cut+color+clarity,
                  method="glm",
                  data=diamonds,
                  trControl = trainControl(method = "cv", number = 5, verboseIter = TRUE))
```

```
+ Fold1: parameter=none 
- Fold1: parameter=none 
+ Fold2: parameter=none 
- Fold2: parameter=none 
+ Fold3: parameter=none 
- Fold3: parameter=none 
+ Fold4: parameter=none 
- Fold4: parameter=none 
+ Fold5: parameter=none 
- Fold5: parameter=none 
Aggregating results
Fitting final model on full training set
```

Model Performance
========================================================


```
Generalized Linear Model 

53940 samples
    4 predictor

No pre-processing
Resampling: Cross-Validated (5 fold) 
Summary of sample sizes: 43152, 43152, 43152, 43152, 43152 
Resampling results:

  RMSE      Rsquared
  1157.351  0.915851

 
```


Deployed Shiny App
========================================================
The Shiny App is easy to use (and beautiful), user just enter the properites and they get the predicted price

This is the link:
https://adham.shinyapps.io/diamonds_price_prediction/

![title](ShinyApp.png)








