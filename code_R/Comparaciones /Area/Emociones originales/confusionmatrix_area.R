#Crear datasets

formulario=read.csv("/Users/sonia/Library/CloudStorage/OneDrive-UniversidaddeCórdoba/INVESTIGACIÓN/ARTÍCULOS Y PONENCIAS/EMOCIONES/formulario4.csv")

IA=read.csv("/Users/sonia/Library/CloudStorage/OneDrive-UniversidaddeCórdoba/INVESTIGACIÓN/ARTÍCULOS Y PONENCIAS/EMOCIONES/realtrans.csv")

library(tidyverse)
library(datasets)

#moda por área

library(modeest)

modatecnologico<-c(mfv1(formulario$P1_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P1_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P1_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P1_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P2_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P2_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P2_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P2_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P3_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P3_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P3_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P3_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P4_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P4_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P4_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P4_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P5_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P5_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P5_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P5_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P6_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P6_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P6_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P6_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P7_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P7_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P7_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P7_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P8_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P8_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P8_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P8_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P9_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P9_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P9_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P9_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P10_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P10_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P10_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P10_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P11_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P11_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P11_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P11_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P12_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P12_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P12_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P12_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P13_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P13_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P13_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P13_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P14_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P14_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P14_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P14_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P15_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P15_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P15_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P15_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P16_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P16_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P16_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P16_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P17_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P17_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P17_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P17_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P18_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P18_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P18_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P18_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P19_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P19_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P19_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P19_V4[formulario$Area_conocimiento==1]),
     mfv1(formulario$P20_V1[formulario$Area_conocimiento==1]),
     mfv1(formulario$P20_V2[formulario$Area_conocimiento==1]),
     mfv1(formulario$P20_V3[formulario$Area_conocimiento==1]),
     mfv1(formulario$P20_V4[formulario$Area_conocimiento==1]))

#crear nuevo dataset con columnas IA y ModaTecnologico.

predTecnologico<- factor(modatecnologico, levels = c(0,1,2,3))

IAyTec <- data.frame(Columna1 = IA$IA, Columna2 = predTecnologico)

colnames(IAyTec) <- c('IA','Tecnologico') 

write_csv(IAyTec,"IAyTecDico.csv")

  
modasocial<-c(mfv1(formulario$P1_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P1_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P1_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P1_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P2_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P2_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P2_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P2_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P3_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P3_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P3_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P3_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P4_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P4_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P4_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P4_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P5_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P5_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P5_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P5_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P6_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P6_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P6_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P6_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P7_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P7_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P7_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P7_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P8_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P8_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P8_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P8_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P9_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P9_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P9_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P9_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P10_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P10_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P10_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P10_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P11_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P11_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P11_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P11_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P12_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P12_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P12_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P12_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P13_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P13_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P13_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P13_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P14_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P14_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P14_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P14_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P15_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P15_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P15_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P15_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P16_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P16_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P16_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P16_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P17_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P17_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P17_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P17_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P18_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P18_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P18_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P18_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P19_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P19_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P19_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P19_V4[formulario$Area_conocimiento==2]),
              mfv1(formulario$P20_V1[formulario$Area_conocimiento==2]),
              mfv1(formulario$P20_V2[formulario$Area_conocimiento==2]),
              mfv1(formulario$P20_V3[formulario$Area_conocimiento==2]),
              mfv1(formulario$P20_V4[formulario$Area_conocimiento==2]))

#crear nuevo dataset con columnas IA y ModaSocial.

predSocial <- factor(modasocial, levels = c(0,1,2,3))

IAySocial <- data.frame(Columna1 = IA$IA, Columna2 = predSocial)

colnames(IAySocial) <- c('IA','Social') 

write_csv(IAySocial,"IAySocialdico.csv")


#Métricas con libreria MLMetrics.

install.packages("MLmetrics")
library(MLmetrics)

matrizSocialDico <-table(IA$IA,predSocial)
matrizTecnologicoDico <-table(IA$IA, predTecnologico)

# Calcular métricas Tecnológico

precision_Tec<-c(Precision(IA$IA, predTecnologico, positive=0),Precision(IA$IA, predTecnologico, positive=1),Precision(IA$IA, predTecnologico, positive=2), Precision(IA$IA, predTecnologico, positive=3) )
recall_Tec <-c(Recall(IA$IA, predTecnologico, positive=0), Recall(IA$IA, predTecnologico, positive=1), Recall(IA$IA, predTecnologico, positive=2), Recall(IA$IA, predTecnologico, positive=3))
f1_score_vector_Tec<- c(F1_Score(IA$IA, predTecnologico, positive=0),F1_Score(IA$IA, predTecnologico, positive=1), F1_Score(IA$IA, predTecnologico, positive=2), F1_Score(IA$IA, predTecnologico, positive=3))

metrica_Tec<-data.frame(Columna1=precision_Tec, Columna2=recall_Tec, Columna3=f1_score_vector_Tec)
colnames(metrica_Tec) <- c("Precisión","Recall","F1_Score") 

# Calcular métricas Social.

precision_Soc<-c(Precision(IA$IA, predSocial, positive=0),Precision(IA$IA, predSocial, positive=1), Precision(IA$IA, predSocial, positive=2), Precision(IA$IA, predSocial, positive=3))
recall_Soc <-c(Recall(IA$IA, predSocial, positive=0), Recall(IA$IA, predSocial, positive=1), Recall(IA$IA, predSocial, positive=2), Recall(IA$IA, predSocial, positive=3))
f1_score_vector_Soc<- c(F1_Score(IA$IA, predSocial, positive=0),F1_Score(IA$IA, predSocial, positive=1),F1_Score(IA$IA, predSocial, positive=2), F1_Score(IA$IA, predSocial, positive=3) )

metrica_Soc<-data.frame(Columna1=precision_Soc, Columna2=recall_Soc, Columna3=f1_score_vector_Soc)
colnames(metrica_Soc) <- c("Precisión","Recall","F1_Score") 

#Ver matrices de confusión.
table(IA$IA,predTecnologico)
table(IA$IA,predSocial)

#Ver tabla de métricas
View(metrica_Tec)
View(metrica_Soc)
