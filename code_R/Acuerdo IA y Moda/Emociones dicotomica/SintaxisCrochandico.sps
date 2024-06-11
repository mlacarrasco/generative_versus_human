﻿* Encoding: UTF-8.

*Proporciones de Xi= nº de personas que están de acuerdo con la IA en la imagen i. i=1,..80.

DESCRIPTIVES VARIABLES=P1_V1 P1_V2 P1_V3 P1_V4 P2_V1 P2_V2 P2_V3 P2_V4 P3_V1 P3_V2 P3_V3 P3_V4
    P4_V1 P4_V2 P4_V3 P4_V4 P5_V1 P5_V2 P5_V3 P5_V4 P6_V1 P6_V2 P6_V3 P6_V4 P7_V1 P7_V2 P7_V3 P7_V4
    P8_V1 P8_V2 P8_V3 P8_V4 P9_V1 P9_V2 P9_V3 P9_V4 P10_V1 P10_V2 P10_V3 P10_V4 P11_V1 P11_V2 P11_V3
    P11_V4 P12_V1 P12_V2 P12_V3 P12_V4 P13_V1 P13_V2 P13_V3 P13_V4 P14_V1 P14_V2 P14_V3 P14_V4 P15_V1
    P15_V2 P15_V3 P15_V4 P16_V1 P16_V2 P16_V3 P16_V4 P17_V1 P17_V2 P17_V3 P17_V4 P18_V1 P18_V2 P18_V3
    P18_V4 P19_V1 P19_V2 P19_V3 P19_V4 P20_V1 P20_V2 P20_V3 P20_V4
  /STATISTICS=MEAN.

*Comparación de proporciones de acuerdo (positivo/negativo).

*Test para Negativo=0.
NPAR TESTS 
   /COCHRAN=P1_V1 P2_V4 P3_V4 P4_V1 P5_V4 P6_V4 P7_V2 P8_V2 P9_V4 P10_V2 P11_V1 P12_V4 
    P13_V4 P14_V3 P15_V3 P16_V3 P17_V1 P18_V1 P19_V3 P20_V2 P1_V2 P2_V1 P3_V3 P4_V2 P5_V3 P6_V3 P7_V3 P8_V4 P9_V1 P10_V1 P11_V2 P12_V3 P13_V3 P14_V1
    P15_V2 P16_V4 P17_V2 P18_V3 P19_V4 P20_V1
   /MISSING LISTWISE.

*Test para Positivo=1. 
NPAR TESTS
  /COCHRAN=P1_V4 P2_V3 P3_V1 P4_V3 P5_V2 P6_V2 P7_V1 P8_V1 P9_V2 P10_V3 P11_V3 P12_V2
    P13_V1 P14_V4 P15_V4 P16_V1 P17_V4 P18_V2 P19_V2 P20_V4 P1_V3 P2_V2 P3_V2 P4_V4 P5_V1 P6_V1 P7_V4 P8_V3 P9_V3 P10_V4 P11_V4 P12_V1 P13_V2 P14_V2
    P15_V1 P16_V2 P17_V3 P18_V4 P19_V1 P20_V3
  /MISSING LISTWISE.





