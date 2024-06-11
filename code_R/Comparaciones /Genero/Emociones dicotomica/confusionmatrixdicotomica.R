
#Crear datasets

formulario=read.csv("/Users/sonia/Library/CloudStorage/OneDrive-UniversidaddeCórdoba/INVESTIGACIÓN/ARTÍCULOS Y PONENCIAS/EMOCIONES/Emociones dicotomica/positivonegativo.csv")

IA=read.csv("/Users/sonia/Library/CloudStorage/OneDrive-UniversidaddeCórdoba/INVESTIGACIÓN/ARTÍCULOS Y PONENCIAS/EMOCIONES/Emociones dicotomica/realtransdico.csv")

library(tidyverse)
library(datasets)


# Calcular moda para las personas

library(modeest)

moda <- c(mfv1(formulario$P1_V1),
          mfv1(formulario$P1_V2),
          mfv1(formulario$P1_V3),
          mfv1(formulario$P1_V4),
          mfv1(formulario$P2_V1),
          mfv1(formulario$P2_V2),
          mfv1(formulario$P2_V3),
          mfv1(formulario$P2_V4),
          mfv1(formulario$P3_V1),
          mfv1(formulario$P3_V2),
          mfv1(formulario$P3_V3),
          mfv1(formulario$P3_V4),
          mfv1(formulario$P4_V1),
          mfv1(formulario$P4_V2),
          mfv1(formulario$P4_V3),
          mfv1(formulario$P4_V4),
          mfv1(formulario$P5_V1),
          mfv1(formulario$P5_V2),
          mfv1(formulario$P5_V3),
          mfv1(formulario$P5_V4),
          mfv1(formulario$P6_V1),
          mfv1(formulario$P6_V2),
          mfv1(formulario$P6_V3),
          mfv1(formulario$P6_V4),
          mfv1(formulario$P7_V1),
          mfv1(formulario$P7_V2),
          mfv1(formulario$P7_V3),
          mfv1(formulario$P7_V4),
          mfv1(formulario$P8_V1),
          mfv1(formulario$P8_V2),
          mfv1(formulario$P8_V3),
          mfv1(formulario$P8_V4),
          mfv1(formulario$P9_V1),
          mfv1(formulario$P9_V2),
          mfv1(formulario$P9_V3),
          mfv1(formulario$P9_V4),
          mfv1(formulario$P10_V1),
          mfv1(formulario$P10_V2),
          mfv1(formulario$P10_V3),
          mfv1(formulario$P10_V4),
          mfv1(formulario$P11_V1),
          mfv1(formulario$P11_V2),
          mfv1(formulario$P11_V3),
          mfv1(formulario$P11_V4),
          mfv1(formulario$P12_V1),
          mfv1(formulario$P12_V2),
          mfv1(formulario$P12_V3),
          mfv1(formulario$P12_V4),
          mfv1(formulario$P13_V1),
          mfv1(formulario$P13_V2),
          mfv1(formulario$P13_V3),
          mfv1(formulario$P13_V4),
          mfv1(formulario$P14_V1),
          mfv1(formulario$P14_V2),
          mfv1(formulario$P14_V3),
          mfv1(formulario$P14_V4),
          mfv1(formulario$P15_V1),
          mfv1(formulario$P15_V2),
          mfv1(formulario$P15_V3),
          mfv1(formulario$P15_V4),
          mfv1(formulario$P16_V1),
          mfv1(formulario$P16_V2),
          mfv1(formulario$P16_V3),
          mfv1(formulario$P16_V4),
          mfv1(formulario$P17_V1),
          mfv1(formulario$P17_V2),
          mfv1(formulario$P17_V3),
          mfv1(formulario$P17_V4),
          mfv1(formulario$P18_V1),
          mfv1(formulario$P18_V2),
          mfv1(formulario$P18_V3),
          mfv1(formulario$P18_V4),
          mfv1(formulario$P19_V1),
          mfv1(formulario$P19_V2),
          mfv1(formulario$P19_V3),
          mfv1(formulario$P19_V4),
          mfv1(formulario$P20_V1),
          mfv1(formulario$P20_V2),
          mfv1(formulario$P20_V3),
          mfv1(formulario$P20_V4))

#crear nuevo dataset con columnas IA y Moda.

predpersonas<- factor(moda, levels = c(0,1))

IAyMODA <- data.frame(Columna1 = IA$IA, Columna2 = predpersonas)

colnames(IAyMODA) <- c('IA','Personas') 

write_csv(IAyMODA,"IAyModadico.csv")

#moda por género

library(modeest)

modahombre<-c(mfv1(formulario$P1_V1[formulario$Genero==0]),
     mfv1(formulario$P1_V2[formulario$Genero==0]),
     mfv1(formulario$P1_V3[formulario$Genero==0]),
     mfv1(formulario$P1_V4[formulario$Genero==0]),
     mfv1(formulario$P2_V1[formulario$Genero==0]),
     mfv1(formulario$P2_V2[formulario$Genero==0]),
     mfv1(formulario$P2_V3[formulario$Genero==0]),
     mfv1(formulario$P2_V4[formulario$Genero==0]),
     mfv1(formulario$P3_V1[formulario$Genero==0]),
     mfv1(formulario$P3_V2[formulario$Genero==0]),
     mfv1(formulario$P3_V3[formulario$Genero==0]),
     mfv1(formulario$P3_V4[formulario$Genero==0]),
     mfv1(formulario$P4_V1[formulario$Genero==0]),
     mfv1(formulario$P4_V2[formulario$Genero==0]),
     mfv1(formulario$P4_V3[formulario$Genero==0]),
     mfv1(formulario$P4_V4[formulario$Genero==0]),
     mfv1(formulario$P5_V1[formulario$Genero==0]),
     mfv1(formulario$P5_V2[formulario$Genero==0]),
     mfv1(formulario$P5_V3[formulario$Genero==0]),
     mfv1(formulario$P5_V4[formulario$Genero==0]),
     mfv1(formulario$P6_V1[formulario$Genero==0]),
     mfv1(formulario$P6_V2[formulario$Genero==0]),
     mfv1(formulario$P6_V3[formulario$Genero==0]),
     mfv1(formulario$P6_V4[formulario$Genero==0]),
     mfv1(formulario$P7_V1[formulario$Genero==0]),
     mfv1(formulario$P7_V2[formulario$Genero==0]),
     mfv1(formulario$P7_V3[formulario$Genero==0]),
     mfv1(formulario$P7_V4[formulario$Genero==0]),
     mfv1(formulario$P8_V1[formulario$Genero==0]),
     mfv1(formulario$P8_V2[formulario$Genero==0]),
     mfv1(formulario$P8_V3[formulario$Genero==0]),
     mfv1(formulario$P8_V4[formulario$Genero==0]),
     mfv1(formulario$P9_V1[formulario$Genero==0]),
     mfv1(formulario$P9_V2[formulario$Genero==0]),
     mfv1(formulario$P9_V3[formulario$Genero==0]),
     mfv1(formulario$P9_V4[formulario$Genero==0]),
     mfv1(formulario$P10_V1[formulario$Genero==0]),
     mfv1(formulario$P10_V2[formulario$Genero==0]),
     mfv1(formulario$P10_V3[formulario$Genero==0]),
     mfv1(formulario$P10_V4[formulario$Genero==0]),
     mfv1(formulario$P11_V1[formulario$Genero==0]),
     mfv1(formulario$P11_V2[formulario$Genero==0]),
     mfv1(formulario$P11_V3[formulario$Genero==0]),
     mfv1(formulario$P11_V4[formulario$Genero==0]),
     mfv1(formulario$P12_V1[formulario$Genero==0]),
     mfv1(formulario$P12_V2[formulario$Genero==0]),
     mfv1(formulario$P12_V3[formulario$Genero==0]),
     mfv1(formulario$P12_V4[formulario$Genero==0]),
     mfv1(formulario$P13_V1[formulario$Genero==0]),
     mfv1(formulario$P13_V2[formulario$Genero==0]),
     mfv1(formulario$P13_V3[formulario$Genero==0]),
     mfv1(formulario$P13_V4[formulario$Genero==0]),
     mfv1(formulario$P14_V1[formulario$Genero==0]),
     mfv1(formulario$P14_V2[formulario$Genero==0]),
     mfv1(formulario$P14_V3[formulario$Genero==0]),
     mfv1(formulario$P14_V4[formulario$Genero==0]),
     mfv1(formulario$P15_V1[formulario$Genero==0]),
     mfv1(formulario$P15_V2[formulario$Genero==0]),
     mfv1(formulario$P15_V3[formulario$Genero==0]),
     mfv1(formulario$P15_V4[formulario$Genero==0]),
     mfv1(formulario$P16_V1[formulario$Genero==0]),
     mfv1(formulario$P16_V2[formulario$Genero==0]),
     mfv1(formulario$P16_V3[formulario$Genero==0]),
     mfv1(formulario$P16_V4[formulario$Genero==0]),
     mfv1(formulario$P17_V1[formulario$Genero==0]),
     mfv1(formulario$P17_V2[formulario$Genero==0]),
     mfv1(formulario$P17_V3[formulario$Genero==0]),
     mfv1(formulario$P17_V4[formulario$Genero==0]),
     mfv1(formulario$P18_V1[formulario$Genero==0]),
     mfv1(formulario$P18_V2[formulario$Genero==0]),
     mfv1(formulario$P18_V3[formulario$Genero==0]),
     mfv1(formulario$P18_V4[formulario$Genero==0]),
     mfv1(formulario$P19_V1[formulario$Genero==0]),
     mfv1(formulario$P19_V2[formulario$Genero==0]),
     mfv1(formulario$P19_V3[formulario$Genero==0]),
     mfv1(formulario$P19_V4[formulario$Genero==0]),
     mfv1(formulario$P20_V1[formulario$Genero==0]),
     mfv1(formulario$P20_V2[formulario$Genero==0]),
     mfv1(formulario$P20_V3[formulario$Genero==0]),
     mfv1(formulario$P20_V4[formulario$Genero==0]))

#crear nuevo dataset con columnas IA y ModaHombre.

predHombres<- factor(modahombre, levels = c(0,1))

IAyH <- data.frame(Columna1 = IA$IA, Columna2 = predHombres)

colnames(IAyH) <- c('IA','Hombres') 

write_csv(IAyH,"IAyHdico.csv")

  
modamujer<-c(mfv1(formulario$P1_V1[formulario$Genero==1]),
              mfv1(formulario$P1_V2[formulario$Genero==1]),
              mfv1(formulario$P1_V3[formulario$Genero==1]),
              mfv1(formulario$P1_V4[formulario$Genero==1]),
              mfv1(formulario$P2_V1[formulario$Genero==1]),
              mfv1(formulario$P2_V2[formulario$Genero==1]),
              mfv1(formulario$P2_V3[formulario$Genero==1]),
              mfv1(formulario$P2_V4[formulario$Genero==1]),
              mfv1(formulario$P3_V1[formulario$Genero==1]),
              mfv1(formulario$P3_V2[formulario$Genero==1]),
              mfv1(formulario$P3_V3[formulario$Genero==1]),
              mfv1(formulario$P3_V4[formulario$Genero==1]),
              mfv1(formulario$P4_V1[formulario$Genero==1]),
              mfv1(formulario$P4_V2[formulario$Genero==1]),
              mfv1(formulario$P4_V3[formulario$Genero==1]),
              mfv1(formulario$P4_V4[formulario$Genero==1]),
              mfv1(formulario$P5_V1[formulario$Genero==1]),
              mfv1(formulario$P5_V2[formulario$Genero==1]),
              mfv1(formulario$P5_V3[formulario$Genero==1]),
              mfv1(formulario$P5_V4[formulario$Genero==1]),
              mfv1(formulario$P6_V1[formulario$Genero==1]),
              mfv1(formulario$P6_V2[formulario$Genero==1]),
              mfv1(formulario$P6_V3[formulario$Genero==1]),
              mfv1(formulario$P6_V4[formulario$Genero==1]),
              mfv1(formulario$P7_V1[formulario$Genero==1]),
              mfv1(formulario$P7_V2[formulario$Genero==1]),
              mfv1(formulario$P7_V3[formulario$Genero==1]),
              mfv1(formulario$P7_V4[formulario$Genero==1]),
              mfv1(formulario$P8_V1[formulario$Genero==1]),
              mfv1(formulario$P8_V2[formulario$Genero==1]),
              mfv1(formulario$P8_V3[formulario$Genero==1]),
              mfv1(formulario$P8_V4[formulario$Genero==1]),
              mfv1(formulario$P9_V1[formulario$Genero==1]),
              mfv1(formulario$P9_V2[formulario$Genero==1]),
              mfv1(formulario$P9_V3[formulario$Genero==1]),
              mfv1(formulario$P9_V4[formulario$Genero==1]),
              mfv1(formulario$P10_V1[formulario$Genero==1]),
              mfv1(formulario$P10_V2[formulario$Genero==1]),
              mfv1(formulario$P10_V3[formulario$Genero==1]),
              mfv1(formulario$P10_V4[formulario$Genero==1]),
              mfv1(formulario$P11_V1[formulario$Genero==1]),
              mfv1(formulario$P11_V2[formulario$Genero==1]),
              mfv1(formulario$P11_V3[formulario$Genero==1]),
              mfv1(formulario$P11_V4[formulario$Genero==1]),
              mfv1(formulario$P12_V1[formulario$Genero==1]),
              mfv1(formulario$P12_V2[formulario$Genero==1]),
              mfv1(formulario$P12_V3[formulario$Genero==1]),
              mfv1(formulario$P12_V4[formulario$Genero==1]),
              mfv1(formulario$P13_V1[formulario$Genero==1]),
              mfv1(formulario$P13_V2[formulario$Genero==1]),
              mfv1(formulario$P13_V3[formulario$Genero==1]),
              mfv1(formulario$P13_V4[formulario$Genero==1]),
              mfv1(formulario$P14_V1[formulario$Genero==1]),
              mfv1(formulario$P14_V2[formulario$Genero==1]),
              mfv1(formulario$P14_V3[formulario$Genero==1]),
              mfv1(formulario$P14_V4[formulario$Genero==1]),
              mfv1(formulario$P15_V1[formulario$Genero==1]),
              mfv1(formulario$P15_V2[formulario$Genero==1]),
              mfv1(formulario$P15_V3[formulario$Genero==1]),
              mfv1(formulario$P15_V4[formulario$Genero==1]),
              mfv1(formulario$P16_V1[formulario$Genero==1]),
              mfv1(formulario$P16_V2[formulario$Genero==1]),
              mfv1(formulario$P16_V3[formulario$Genero==1]),
              mfv1(formulario$P16_V4[formulario$Genero==1]),
              mfv1(formulario$P17_V1[formulario$Genero==1]),
              mfv1(formulario$P17_V2[formulario$Genero==1]),
              mfv1(formulario$P17_V3[formulario$Genero==1]),
              mfv1(formulario$P17_V4[formulario$Genero==1]),
              mfv1(formulario$P18_V1[formulario$Genero==1]),
              mfv1(formulario$P18_V2[formulario$Genero==1]),
              mfv1(formulario$P18_V3[formulario$Genero==1]),
              mfv1(formulario$P18_V4[formulario$Genero==1]),
              mfv1(formulario$P19_V1[formulario$Genero==1]),
              mfv1(formulario$P19_V2[formulario$Genero==1]),
              mfv1(formulario$P19_V3[formulario$Genero==1]),
              mfv1(formulario$P19_V4[formulario$Genero==1]),
              mfv1(formulario$P20_V1[formulario$Genero==1]),
              mfv1(formulario$P20_V2[formulario$Genero==1]),
              mfv1(formulario$P20_V3[formulario$Genero==1]),
              mfv1(formulario$P20_V4[formulario$Genero==1]))

#crear nuevo dataset con columnas IA y ModaMujer.

predMujeres<- factor(modamujer, levels = c(0,1))

IAyM <- data.frame(Columna1 = IA$IA, Columna2 = predMujeres)

colnames(IAyM) <- c('IA','Mujeres') 

write_csv(IAyM,"IAyMdico.csv")


#Métricas con libreria MLMetrics.

install.packages("MLmetrics")
library(MLmetrics)

matrizpersonasdico <-table(IA$IA, predpersonas)
matrizHdico <-table(IA$IA,predHombres)
matrizMdico <-table(IA$IA, predMujeres)


#Calcular métricas generales. 

precisionvector<-c(Precision(IA$IA, predpersonas, positive=0),Precision(IA$IA, predpersonas, positive=1))
recallvector<- c(Recall(IA$IA, predpersonas, positive=0), Recall(IA$IA, predpersonas, positive=1))
f1_score_vector<- c(F1_Score(IA$IA, predpersonas, positive=0),F1_Score(IA$IA, predpersonas, positive=1))

metricadico <-data.frame(Columna1=precisionvector, Columna2=recallvector, Columna3=f1_score_vector)
colnames(metricadico) <- c("Precisión","Recall","F1_Score") 

# Calcular métricas Hombres.

precision_H<-c(Precision(IA$IA, predHombres, positive=0),Precision(IA$IA, predHombres, positive=1))
recall_H <-c(Recall(IA$IA, predHombres, positive=0), Recall(IA$IA, predHombres, positive=1))
f1_score_vector_H<- c(F1_Score(IA$IA, predHombres, positive=0),F1_Score(IA$IA, predHombres, positive=1))

metrica_H_dico <-data.frame(Columna1=precision_H, Columna2=recall_H, Columna3=f1_score_vector_H)
colnames(metrica_H_dico) <- c("Precisión","Recall","F1_Score") 

# Calcular métricas Mujeres.

precision_M<-c(Precision(IA$IA, predMujeres, positive=0),Precision(IA$IA, predMujeres, positive=1))
recall_M <-c(Recall(IA$IA, predMujeres, positive=0), Recall(IA$IA, predMujeres, positive=1))
f1_score_vector_M<- c(F1_Score(IA$IA, predMujeres, positive=0),F1_Score(IA$IA, predMujeres, positive=1))

metrica_M_dico <-data.frame(Columna1=precision_M, Columna2=recall_M, Columna3=f1_score_vector_M)
colnames(metrica_M_dico) <- c("Precisión","Recall","F1_Score") 
