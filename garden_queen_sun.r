# load "dplyr"
# library(dplyr)

#1  setwd('Fitness for All')
#2  data <- read.delim('fitness-for-all.dat')
#3  clean_data <- na.omit(data)
#4  colnames(clean_data) <- c('age', 'exercise', 'medical', 'diet', 'activity') 
#5  desc_stat <- colMeans(clean_data)
#6  summary(desc_stat)
#7  subset_data <- select(clean_data, exercise, medical, diet, activity)
#8  colMeans(subset_data)
#9  cor_data <- cor(subset_data)
#10 cor_test <- cor.test(subset_data)
#11  plot(subset_data)
#12  library(ggplot2)
#13  qplot(exercise, medical, data = subset_data, geom = 'point')
#14  qplot(exercise, diet, data = subset_data, geom = 'point') 
#15  qplot(exercise, activity, data = subset_data, geom = 'point')
#16  library(stats)
#17  lm_exercise <- lm(medical ~ exercise, data = subset_data) 
#18  lm_diet <- lm(medical ~ diet, data = subset_data)
#19  lm_activity <- lm(medical ~ exercise, data = subset_data)
#20  anova(lm_exercise, lm_diet, lm_activity)
#21  summary(lm_exercise)
#22  summary(lm_diet)
#23  summary(lm_activity)
#24  library(reshape2)
#25  data_melt <- melt(subset_data, id = c('exercise', 'medical'))
#26  qplot(variable, value, data = data_melt, geom = 'point', col = 'diet')
#27  cov_data <- cov(subset_data)
#28  cov.test(subset_data)
#29  library(factoextra)
#30  fviz_pca_var(subset_data)
#31  cor_data <- cor(subset_data)
#32  library(cluster)
#33  fit <- kmeans(subset_data, 3)
#34  summary(fit)
#35  fviz_cluster(fit)
#36  fit_hc <- hclust(subset_data)
#37  fit_hc
#38  fviz_dend(fit_hc)
#39  library(vegan)
#40  bc <- betadisper(subset_data, fit$cluster)
#41  fviz_disp(bc)
#42  library(ggpubr)
#43  fviz_mahalanobis(x = subset_data, group = fit$cluster)
#44  library(psych)
#45  fa <- factanal(subset_data, factors = 5,rotation = "varimax")
#46  summary(fa)
#47  fa$loadings 
#48  summary(unclass(fa))
#49  library(dummies)
#50  dummy <- dummy.data.frame(clean_data)
#51  dummy_regression <- lm(medical ~ ., data = dummy)
#52  summary(dummy_regression)
#53  library(bestglm)
#54  bestglm(dummy_regression)
#55  library(glmnet)
#56  cv_ridge <- cv.glmnet(dummy_regression)
#57  plot(cv_ridge)
#58  cv_ridge$lambda.min
#59  library(caret)
#60  svm_model <- svm(medical ~ ., data = dummy)
#61  summary(svm_model)
#62  library(caret)
#63  model_tree <- rpart(medical ~ ., data = dummy)
#64  summary(model_tree)
#65  library(e1071)
#66  library(randomForest)
#67  RF_model <- randomForest(medical ~ ., data = dummy)
#68  summary(RF_model)
#69  importance(RF_model)
#70  library(xgboost)
#71  GB_model <- xgboost(data = dummy, label = medical)
#72  summary(GB_model)
#73  library(Hmisc)
#74  log_model <- rcorr(as.matrix(dummy_regression))
#75  summary(log_model)
#76  library(caret)
#77  train_control <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
#78  model_caret <- train(medical ~ ., data = dummy, method = "glmnet", trControl = train_control)
#79  summary(model_caret)
#80  library(caretEnsemble)
#81  ens_model <- caretEnsemble(dummy, medical, method = "glmnet")
#82  summary(ens_model)
#83  library(rpart.plot)
#84  rpart.plot(model_tree, type = 4)
#85  library(rattle)
#86  rpart.plot(model_tree, type = 5)
#87  plot(RF_model)
#88  library(pROC)
#89  roc_pred <- predict(RF_model, newdata = dummy)
#90  auroc(roc_pred, medical)
#91  library(MLmetrics)
#92  metrics <- MLmetrics::MSE(roc_pred, medical)
#93  print(metrics)
#94  library(MLmetrics)
#95  metrics <- MLmetrics::RMSE(roc_pred, medical)
#96  print(metrics)
#97  library(MLmetrics)
#98  metrics <- MLmetrics::MAE(roc_pred, medical)
#99  print(metrics)
#100 library(MLmetrics)
#101 metrics <- MLmetrics::MAPE(roc_pred, medical)
#102 print(metrics)
#103 library(MLmetrics)
#104 metrics <- MLmetrics::Rsquared(roc_pred, medical)
#105 print(metrics)
#106 library(Hmisc)
#107 conf <- rcorr(as.matrix(dummy_regression))
#108 print(conf)
#109 library(pROC)
#110 pred_log <- predict(dummy_regression, newdata = dummy)
#111 auroc(pred_log, medical)
#112 library(pROC)
#113 pred_svm <- predict(svm_model, newdata = dummy)
#114 auroc(pred_svm, medical)
#115 library(pROC)
#116 pred_model_caret <- predict(model_caret, newdata = dummy)
#117 auroc(pred_model_caret, medical)
#118 library(GGally)
#119 ggpairs(subset_data)
#120 library(reshape2)
#121 dens_data <- melt(subset_data, id = c('exercise', 'medical'))
#122 ggplot(dens_data, aes(x = variable, y = value, fill = ..x..)) +
#123 geom_density_ridges(alpha = 0.1, jittered_points = FALSE)
#124 library(ggplot2)
#125 ggplot(data_melt, aes(x = variable, y = value)) + 
#126 geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) + 
#127 facet_wrap(~ exercise, ncol = 3, scales = 'free_x') 
#128 library(ggplot2)
#129 ggplot(data_melt, aes(x = variable, y = value, fill = exercise)) + 
#130 geom_boxplot() + 
#131 facet_wrap(~ exercise, ncol = 3, scales = 'free_x')
#132 library(ggplot2)
#133 ggplot(data_melt, aes(x = variable, y = value, color = exercise)) + 
#134 geom_point(alpha = 0.2) + 
#135 facet_wrap(~ exercise, ncol = 3, scales = 'free_x') + 
#136 geom_smooth(method = lm)
#137 library(ggpubr)
#138 ggarrange(
#139  ggplot(data_melt, aes(x = variable, y = value, fill = exercise)) + 
#140  geom_boxplot() + 
#141  facet_wrap(~ exercise, ncol = 3, scales = 'free_x'), 
#142  ggplot(data_melt, aes(x = variable, y = value, color = exercise)) + 
#143  geom_point(alpha = 0.2) + 
#144  facet_wrap(~ exercise, ncol = 3, scales = 'free_x') + 
#145  geom_smooth(method = lm), 
#146  nrow = 1
#147 )
#148 library(ggpubr)
#149 ggpar(
#150   ggplot(data_melt, aes(x = variable, y = value, fill = exercise)) + 
#151   geom_boxplot() + 
#152   facet_wrap(~ exercise, ncol = 3, scales = 'free_x') + 
#153   ggtitle('Box Plot of Exercise'), 
#154   ggplot(data_melt, aes(x = variable, y = value, color = exercise)) + 
#155   geom_point(alpha = 0.2) + 
#156   facet_wrap(~ exercise, ncol = 3, scales = 'free_x') + 
#157   geom_smooth(method = lm) + 
#158   ggtitle('Scatter Plot of Exercise')
#159 )
#160 library(ggpubr)
#161 ggarrange(
#162   qplot(exercise, medical, data = subset_data, geom = 'point'), 
#163   qplot(exercise, diet, data = subset_data, geom = 'point'), 
#164   qplot(exercise, activity, data = subset_data, geom = 'point'), 
#165   nrow = 1
#166 )
#167 library(ggpubr)
#168 ggpar(
#169   qplot(exercise, medical, data = subset_data, geom = 'point') + 
#170   ggtitle('Exercise vs Medical'), 
#171   qplot(exercise, diet, data = subset_data, geom = 'point') + 
#172   ggtitle('Exercise vs Diet'), 
#173   qplot(exercise, activity, data = subset_data, geom = 'point') + 
#174   ggtitle('Exercise vs Activity')
#175 )
#176 library(gridExtra)
#177 grid.arrange(
#178   qplot(exercise, medical, data = subset_data, geom = 'point'), 
#179   qplot(exercise, diet, data = subset_data, geom = 'point'), 
#180   qplot(exercise, activity, data = subset_data, geom = 'point'), 
#181   nrow = 2
#182 )
#183 library(ggplot2)
#184 ggplot(subset_data, aes(x = exercise, y = medical)) +
#185 geom_point() +
#186 geom_smooth(method = glm)
#187 library(ggplot2)
#188 ggplot(subset_data, aes(x = exercise, y = diet)) +
#189 geom_point() +
#190 geom_smooth(method = glm)
#191 library(ggplot2)
#192 ggplot(subset_data, aes(x = exercise, y = activity)) +
#193 geom_point() +
#194 geom_smooth(method = glm)
#195 library(GGally)
#196 ggpairs(subset_data, lower = list(continuous = wrap("points", alpha = 0.3)))
#197 library(ggplot2)
#198 ggplot(data_melt, aes(x = variable, y = value)) +
#199 geom_jitter(height = 0, width = 0.3)
#200 library(GGally)
#201 ggpairs(subset_data, lower = list(continuous = "smooth"))