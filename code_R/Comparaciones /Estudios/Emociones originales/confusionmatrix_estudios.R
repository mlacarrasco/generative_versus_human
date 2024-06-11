
#Abrir archivos

formulario=read.csv("/Users/sonia/Library/CloudStorage/OneDrive-UniversidaddeCórdoba/INVESTIGACIÓN/ARTÍCULOS Y PONENCIAS/EMOCIONES/formulario4.csv")

IA=read.csv("/Users/sonia/Library/CloudStorage/OneDrive-UniversidaddeCórdoba/INVESTIGACIÓN/ARTÍCULOS Y PONENCIAS/EMOCIONES/realtrans.csv")

library(tidyverse)
library(datasets)

#moda por tipo de estudios

library(modeest)

modapostgraduados<-c(mfv1(formulario$P1_V1[formulario$Estudios==1]),
     mfv1(formulario$P1_V2[formulario$Estudios==1]),
     mfv1(formulario$P1_V3[formulario$Estudios==1]),
     mfv1(formulario$P1_V4[formulario$Estudios==1]),
     mfv1(formulario$P2_V1[formulario$Estudios==1]),
     mfv1(formulario$P2_V2[formulario$Estudios==1]),
     mfv1(formulario$P2_V3[formulario$Estudios==1]),
     mfv1(formulario$P2_V4[formulario$Estudios==1]),
     mfv1(formulario$P3_V1[formulario$Estudios==1]),
     mfv1(formulario$P3_V2[formulario$Estudios==1]),
     mfv1(formulario$P3_V3[formulario$Estudios==1]),
     mfv1(formulario$P3_V4[formulario$Estudios==1]),
     mfv1(formulario$P4_V1[formulario$Estudios==1]),
     mfv1(formulario$P4_V2[formulario$Estudios==1]),
     mfv1(formulario$P4_V3[formulario$Estudios==1]),
     mfv1(formulario$P4_V4[formulario$Estudios==1]),
     mfv1(formulario$P5_V1[formulario$Estudios==1]),
     mfv1(formulario$P5_V2[formulario$Estudios==1]),
     mfv1(formulario$P5_V3[formulario$Estudios==1]),
     mfv1(formulario$P5_V4[formulario$Estudios==1]),
     mfv1(formulario$P6_V1[formulario$Estudios==1]),
     mfv1(formulario$P6_V2[formulario$Estudios==1]),
     mfv1(formulario$P6_V3[formulario$Estudios==1]),
     mfv1(formulario$P6_V4[formulario$Estudios==1]),
     mfv1(formulario$P7_V1[formulario$Estudios==1]),
     mfv1(formulario$P7_V2[formulario$Estudios==1]),
     mfv1(formulario$P7_V3[formulario$Estudios==1]),
     mfv1(formulario$P7_V4[formulario$Estudios==1]),
     mfv1(formulario$P8_V1[formulario$Estudios==1]),
     mfv1(formulario$P8_V2[formulario$Estudios==1]),
     mfv1(formulario$P8_V3[formulario$Estudios==1]),
     mfv1(formulario$P8_V4[formulario$Estudios==1]),
     mfv1(formulario$P9_V1[formulario$Estudios==1]),
     mfv1(formulario$P9_V2[formulario$Estudios==1]),
     mfv1(formulario$P9_V3[formulario$Estudios==1]),
     mfv1(formulario$P9_V4[formulario$Estudios==1]),
     mfv1(formulario$P10_V1[formulario$Estudios==1]),
     mfv1(formulario$P10_V2[formulario$Estudios==1]),
     mfv1(formulario$P10_V3[formulario$Estudios==1]),
     mfv1(formulario$P10_V4[formulario$Estudios==1]),
     mfv1(formulario$P11_V1[formulario$Estudios==1]),
     mfv1(formulario$P11_V2[formulario$Estudios==1]),
     mfv1(formulario$P11_V3[formulario$Estudios==1]),
     mfv1(formulario$P11_V4[formulario$Estudios==1]),
     mfv1(formulario$P12_V1[formulario$Estudios==1]),
     mfv1(formulario$P12_V2[formulario$Estudios==1]),
     mfv1(formulario$P12_V3[formulario$Estudios==1]),
     mfv1(formulario$P12_V4[formulario$Estudios==1]),
     mfv1(formulario$P13_V1[formulario$Estudios==1]),
     mfv1(formulario$P13_V2[formulario$Estudios==1]),
     mfv1(formulario$P13_V3[formulario$Estudios==1]),
     mfv1(formulario$P13_V4[formulario$Estudios==1]),
     mfv1(formulario$P14_V1[formulario$Estudios==1]),
     mfv1(formulario$P14_V2[formulario$Estudios==1]),
     mfv1(formulario$P14_V3[formulario$Estudios==1]),
     mfv1(formulario$P14_V4[formulario$Estudios==1]),
     mfv1(formulario$P15_V1[formulario$Estudios==1]),
     mfv1(formulario$P15_V2[formulario$Estudios==1]),
     mfv1(formulario$P15_V3[formulario$Estudios==1]),
     mfv1(formulario$P15_V4[formulario$Estudios==1]),
     mfv1(formulario$P16_V1[formulario$Estudios==1]),
     mfv1(formulario$P16_V2[formulario$Estudios==1]),
     mfv1(formulario$P16_V3[formulario$Estudios==1]),
     mfv1(formulario$P16_V4[formulario$Estudios==1]),
     mfv1(formulario$P17_V1[formulario$Estudios==1]),
     mfv1(formulario$P17_V2[formulario$Estudios==1]),
     mfv1(formulario$P17_V3[formulario$Estudios==1]),
     mfv1(formulario$P17_V4[formulario$Estudios==1]),
     mfv1(formulario$P18_V1[formulario$Estudios==1]),
     mfv1(formulario$P18_V2[formulario$Estudios==1]),
     mfv1(formulario$P18_V3[formulario$Estudios==1]),
     mfv1(formulario$P18_V4[formulario$Estudios==1]),
     mfv1(formulario$P19_V1[formulario$Estudios==1]),
     mfv1(formulario$P19_V2[formulario$Estudios==1]),
     mfv1(formulario$P19_V3[formulario$Estudios==1]),
     mfv1(formulario$P19_V4[formulario$Estudios==1]),
     mfv1(formulario$P20_V1[formulario$Estudios==1]),
     mfv1(formulario$P20_V2[formulario$Estudios==1]),
     mfv1(formulario$P20_V3[formulario$Estudios==1]),
     mfv1(formulario$P20_V4[formulario$Estudios==1]))

#crear nuevo dataset con columnas IA y ModaGraduados.

predPostgraduados<- factor(modapostgraduados, levels = c(0,1,2,3))

IAypostgraduados <- data.frame(Columna1 = IA$IA, Columna2 = predPostgraduados)

colnames(IAypostgraduados) <- c('IA','Postgraduados') 

write_csv(IAypostgraduados,"IAyPostgraduados.csv")

  
modagraduados<-c(mfv1(formulario$P1_V1[formulario$Estudios==2]),
              mfv1(formulario$P1_V2[formulario$Estudios==2]),
              mfv1(formulario$P1_V3[formulario$Estudios==2]),
              mfv1(formulario$P1_V4[formulario$Estudios==2]),
              mfv1(formulario$P2_V1[formulario$Estudios==2]),
              mfv1(formulario$P2_V2[formulario$Estudios==2]),
              mfv1(formulario$P2_V3[formulario$Estudios==2]),
              mfv1(formulario$P2_V4[formulario$Estudios==2]),
              mfv1(formulario$P3_V1[formulario$Estudios==2]),
              mfv1(formulario$P3_V2[formulario$Estudios==2]),
              mfv1(formulario$P3_V3[formulario$Estudios==2]),
              mfv1(formulario$P3_V4[formulario$Estudios==2]),
              mfv1(formulario$P4_V1[formulario$Estudios==2]),
              mfv1(formulario$P4_V2[formulario$Estudios==2]),
              mfv1(formulario$P4_V3[formulario$Estudios==2]),
              mfv1(formulario$P4_V4[formulario$Estudios==2]),
              mfv1(formulario$P5_V1[formulario$Estudios==2]),
              mfv1(formulario$P5_V2[formulario$Estudios==2]),
              mfv1(formulario$P5_V3[formulario$Estudios==2]),
              mfv1(formulario$P5_V4[formulario$Estudios==2]),
              mfv1(formulario$P6_V1[formulario$Estudios==2]),
              mfv1(formulario$P6_V2[formulario$Estudios==2]),
              mfv1(formulario$P6_V3[formulario$Estudios==2]),
              mfv1(formulario$P6_V4[formulario$Estudios==2]),
              mfv1(formulario$P7_V1[formulario$Estudios==2]),
              mfv1(formulario$P7_V2[formulario$Estudios==2]),
              mfv1(formulario$P7_V3[formulario$Estudios==2]),
              mfv1(formulario$P7_V4[formulario$Estudios==2]),
              mfv1(formulario$P8_V1[formulario$Estudios==2]),
              mfv1(formulario$P8_V2[formulario$Estudios==2]),
              mfv1(formulario$P8_V3[formulario$Estudios==2]),
              mfv1(formulario$P8_V4[formulario$Estudios==2]),
              mfv1(formulario$P9_V1[formulario$Estudios==2]),
              mfv1(formulario$P9_V2[formulario$Estudios==2]),
              mfv1(formulario$P9_V3[formulario$Estudios==2]),
              mfv1(formulario$P9_V4[formulario$Estudios==2]),
              mfv1(formulario$P10_V1[formulario$Estudios==2]),
              mfv1(formulario$P10_V2[formulario$Estudios==2]),
              mfv1(formulario$P10_V3[formulario$Estudios==2]),
              mfv1(formulario$P10_V4[formulario$Estudios==2]),
              mfv1(formulario$P11_V1[formulario$Estudios==2]),
              mfv1(formulario$P11_V2[formulario$Estudios==2]),
              mfv1(formulario$P11_V3[formulario$Estudios==2]),
              mfv1(formulario$P11_V4[formulario$Estudios==2]),
              mfv1(formulario$P12_V1[formulario$Estudios==2]),
              mfv1(formulario$P12_V2[formulario$Estudios==2]),
              mfv1(formulario$P12_V3[formulario$Estudios==2]),
              mfv1(formulario$P12_V4[formulario$Estudios==2]),
              mfv1(formulario$P13_V1[formulario$Estudios==2]),
              mfv1(formulario$P13_V2[formulario$Estudios==2]),
              mfv1(formulario$P13_V3[formulario$Estudios==2]),
              mfv1(formulario$P13_V4[formulario$Estudios==2]),
              mfv1(formulario$P14_V1[formulario$Estudios==2]),
              mfv1(formulario$P14_V2[formulario$Estudios==2]),
              mfv1(formulario$P14_V3[formulario$Estudios==2]),
              mfv1(formulario$P14_V4[formulario$Estudios==2]),
              mfv1(formulario$P15_V1[formulario$Estudios==2]),
              mfv1(formulario$P15_V2[formulario$Estudios==2]),
              mfv1(formulario$P15_V3[formulario$Estudios==2]),
              mfv1(formulario$P15_V4[formulario$Estudios==2]),
              mfv1(formulario$P16_V1[formulario$Estudios==2]),
              mfv1(formulario$P16_V2[formulario$Estudios==2]),
              mfv1(formulario$P16_V3[formulario$Estudios==2]),
              mfv1(formulario$P16_V4[formulario$Estudios==2]),
              mfv1(formulario$P17_V1[formulario$Estudios==2]),
              mfv1(formulario$P17_V2[formulario$Estudios==2]),
              mfv1(formulario$P17_V3[formulario$Estudios==2]),
              mfv1(formulario$P17_V4[formulario$Estudios==2]),
              mfv1(formulario$P18_V1[formulario$Estudios==2]),
              mfv1(formulario$P18_V2[formulario$Estudios==2]),
              mfv1(formulario$P18_V3[formulario$Estudios==2]),
              mfv1(formulario$P18_V4[formulario$Estudios==2]),
              mfv1(formulario$P19_V1[formulario$Estudios==2]),
              mfv1(formulario$P19_V2[formulario$Estudios==2]),
              mfv1(formulario$P19_V3[formulario$Estudios==2]),
              mfv1(formulario$P19_V4[formulario$Estudios==2]),
              mfv1(formulario$P20_V1[formulario$Estudios==2]),
              mfv1(formulario$P20_V2[formulario$Estudios==2]),
              mfv1(formulario$P20_V3[formulario$Estudios==2]),
              mfv1(formulario$P20_V4[formulario$Estudios==2]))

#crear nuevo dataset con columnas IA y Modagraduados.

predGraduados<- factor(modagraduados, levels = c(0,1,2,3))

IAyGraduados <- data.frame(Columna1 = IA$IA, Columna2 = predGraduados)

colnames(IAyGraduados) <- c('IA','Graduados') 

write_csv(IAyGraduados,"IAyGraduadosemoc.csv")


#Métricas con libreria MLMetrics.

install.packages("MLmetrics")
library(MLmetrics)

matrizGrad <-table(IA$IA,predGraduados)
matrizPostgrad <-table(IA$IA, predPostgraduados)

# Calcular métricas Graduados

precision_Grad<-c(Precision(IA$IA, predGraduados, positive=0),Precision(IA$IA, predGraduados, positive=1),Precision(IA$IA, predGraduados, positive=2),Precision(IA$IA, predGraduados, positive=3) )
recall_Grad <-c(Recall(IA$IA, predGraduados, positive=0), Recall(IA$IA, predGraduados, positive=1),Recall(IA$IA, predGraduados, positive=2), Recall(IA$IA, predGraduados, positive=3))
f1_score_vector_Grad<- c(F1_Score(IA$IA, predGraduados, positive=0),F1_Score(IA$IA, predGraduados, positive=1), F1_Score(IA$IA, predGraduados, positive=2), F1_Score(IA$IA, predGraduados, positive=3))

metrica_Grad<-data.frame(Columna1=precision_Grad, Columna2=recall_Grad, Columna3=f1_score_vector_Grad)
colnames(metrica_Grad) <- c("Precisión","Recall","F1_Score") 

# Calcular métricas Postgraduados.

precision_Post<-c(Precision(IA$IA, predPostgraduados, positive=0),Precision(IA$IA, predPostgraduados, positive=1), Precision(IA$IA, predPostgraduados, positive=2), Precision(IA$IA, predPostgraduados, positive=3))
recall_Post <-c(Recall(IA$IA, predPostgraduados, positive=0), Recall(IA$IA, predPostgraduados, positive=1), Recall(IA$IA, predPostgraduados, positive=2), Recall(IA$IA, predPostgraduados, positive=3))
f1_score_vector_Post<- c(F1_Score(IA$IA, predPostgraduados, positive=0),F1_Score(IA$IA, predPostgraduados, positive=1), F1_Score(IA$IA, predPostgraduados, positive=2), F1_Score(IA$IA, predPostgraduados, positive=3))

metrica_Post<-data.frame(Columna1=precision_Post, Columna2=recall_Post, Columna3=f1_score_vector_Post)
colnames(metrica_Post) <- c("Precisión","Recall","F1_Score") 

#Ver matrices de confusión.
table(IA$IA,predGraduados)
table(IA$IA,predPostgraduados)

#Ver tabla de métricas
View(metrica_Post)
View(metrica_Grad)
