Developing Data Product Final Assignment
========================================================
author: Basudha Misra 
date: 11th November, 2017
autosize: true
font-family : 'Comic Sans MS'



My Assignment Webpage
========================================================

- **Purpose:** My shiny webpage is an interactive regression model predictor.

- **Data:** Credit data of ISLR package in R is used for my webpage.
[(*link for the data*)](https://cran.r-project.org/web/packages/ISLR/ISLR.pdf)

- **Input:** Student, Ethnicity, Married, Income variables of Credit data are the inputs for my webpage.

- **Output:** Two different model predictions of Balance variable of Credit data is the output of the webpage.

Input variable Ranges
========================================================

- **Student:** Yes/No (Wheather the person is student or not).

- **Ethnicity:** African American/Asian/Caucasian.

- **Married:** Yes/No (Wheather the person is married or not).

- **Income:** ($10 - $200) x ($10,000 units)


My Models
========================================================


```r
# Packages Used:
library(shiny)
library(ISLR)
#My data
dim(Credit)
```

```
[1] 400  12
```

```r
# My models:
  model1 <- lm(Balance ~ Income,  data = Credit)
  model2 <- lm(Balance ~ Income + Ethnicity + Married + Student, data = Credit)
```


Both models finally predict the estimated Balance. These predicted numbers are shown 
as text as well as in a Balance data distribution plot.



Focus Points of the Assignment
========================================================

- Easy to understand regression model.

- Easily available data.

- Simple webpage development using Shiny package.

- Properly commented code made available in github.

**Thank You!!**
