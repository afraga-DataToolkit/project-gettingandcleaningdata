---
title: "CodeBook"
author: "Alejandro Fraga"
date: "Monday, February 16, 2015"
output: html_document
---

This document will describe the variables used on my run_analysis.R script

```{r}
str(valid_feature_names)

This variable holds the feature names gathered from features.txt file.

```{r}
summary(x_test_data)

This local variable holds the test data gathered from X_test.txt
A data frame is created with all the inputs

```

```{r}
summary(x_test_subset)

This local variable holds the mean and std test data subset from x_test_data

```

```{r}
summary(x_train_data)

This local variable holds the train data gathered from X_train.txt
A data frame is created with all the inputs

```

```{r}
summary(x_train_subset)

This local variable holds the mean and std test data subset from x_train_data

```

```{r}
summary(x_train_subset)

This local variable consolidate both test and train data for all mean and std values

```
