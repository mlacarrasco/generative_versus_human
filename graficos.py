'''
Artículo: Tesis Raúl Dastres
Fecha: 09-01-2024
version 1.1
'''

import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt
from matplotlib import cm

tipo = lambda categoria_real:'+' if categoria_real=='Positive' else '-'

patterns = [ "o.o", "o.","ooo", "oO", "OO", 'xxxx', '//////', '..o','....']

#*****>*****>*****>*****>*****>*****>*****>*****>*****>*****>*****>*****>
def grafico(df_form, columna, diccionario, size_inches, filename):

    font = {'family': 'monospace',
        'color':  'tomato',
        'weight': 'light',
        'size': 8,
        }
    plt.rcParams['font.family'] = 'monospace'
    plt.rcParams['font.size']= 9.5
    
    df_analisis = df_form[columna].to_frame(name=columna).replace(diccionario)
    gp_analisis =df_analisis.value_counts() #extrae el número de valores por categoría
    gp_analisis = gp_analisis.reset_index() #resetea el indice y lo incluye en una columna
    print(gp_analisis)

    diccionario_analisis = pd.Series(diccionario)
    print(diccionario_analisis)

    orden = gp_analisis.iloc[:,0]
    value = gp_analisis.iloc[:,1]

    fig = plt.figure(dpi=200)
    
    fig.set_size_inches(size_inches)
    ax1 = fig.add_subplot(111)
    
    clevels = np.linspace(0., 1., len(diccionario_analisis))

    for i, ibar in enumerate(diccionario_analisis[orden].keys()):
        if ibar=='Engineering':
            ibar = 'Engineering and\nTechnology'
        if ibar=='Vocational Training':
            ibar = 'Vocation\nTraining'
        if ibar=='Social Sciences':
            ibar='Social\nSciences'
        if ibar=='Natural Sciences':
            ibar='Natural\nSciences' 
            
        ax1.bar(x=ibar,height= value[i],
                width=0.5, 
                label=ibar, 
                hatch=patterns[i],
                color='white',
                fill=True, 
                edgecolor='gray',
                lw=0.5, 
                zorder = 0)
        ax1.text(y =value[i]+0.2, x= i-0.05, s=f'{value[i]}',fontdict= font )
        
        #agregamos el borde con otro color
        ax1.bar(x=ibar,
                height= value[i], 
                width=0.5,
                color='none', 
                edgecolor='black',
                alpha=0.2,
                fill=True,
                zorder=1, 
                lw=1.)
    

    ax1.set_ylabel('# participants')
    plt.grid(color='gray', alpha=0.2, linestyle=':', axis='y')
    #plt.legend()
    plt.tight_layout()
    plt.savefig(f'graficos/{filename}')
    #plt.show()
    

#////////////////////////////////////////////////////////////////////////////////////////////////////
def analisis(mode, umbral):
    '''
    mode:  # 0: significa que tenemos 4 clases de emociones
           # 1: significa que tenemos 2 clases (positivo o negativo)               
    umbral: define el porcentaje de valores que están clasificados en una opción
    '''

    dcc_ocde_cat = {'Graduate':0, 
                'Postgraduate':1, 
                'Secondary':2, 
                'None':3,
                'Vocational Training':4
                }
    
    dcc_genre = {'Male':0, 'Female':1}

    dcc_country = {'Chile':0, 
                  'Spain':1,
                  'Italy':2,
                  'Romania':3,
                  'Argentina':4,
                  'Greece':5,
                  'Venezuela':6,
                  'Turkey':7,
                  'Bolivia':8
                  }

    dcc_ocde_area= {'Engineering':0,
                    'Social Sciences':1,
                    'Natural Sciences':2,
                    'Humanities':3,
                    'None':4}
    

    #lectura de datos reales
    df_form = pd.read_csv('data/form_3.csv')

    print(df_form.columns)
    df_age = df_form['age'].to_frame()
    
    boxprops = dict(linestyle='-', linewidth=1, color='blue')
    medianprops = dict(linestyle='-', linewidth=3,color='black', label='median')
    wiskers = dict(linestyle='--', linewidth=1, color='gray')

    fig = plt.figure(dpi=200)
    fig.set_size_inches(13,2)
    plt.yticks(np.linspace(15,60,16))
    df_age.boxplot(showfliers=False, showmeans=True,
                    boxprops=boxprops,
                    bootstrap=None,
                    medianprops=medianprops,
                    whiskerprops = wiskers,
                    manage_ticks=True,
                    capwidths=[0.05],vert=False)
    
    y = df_age.to_numpy() 
    
    x = np.random.normal(1, 0.08, size=len(y))
    plt.plot(y, x, 'ro', alpha=0.2)


    plt.grid(color='gray', alpha=0.2, linestyle=':',axis='y')
    
    plt.plot([], [], '^', linewidth=1, color='green', label='mean')
    plt.plot([], [], 'ro', linewidth=1, color='red', label='data points')
    plt.xlabel('Age')
    plt.legend(bbox_to_anchor=(-0.05, 1))
    plt.tight_layout()
    plt.savefig('graficos/fig_1.png')
    #plt.show()
    

    grafico(df_form, 'study', dcc_ocde_cat, size_inches=(6,3), filename='fig_2.png')
    grafico(df_form, 'genre', dcc_genre, size_inches=(3,3),filename='fig_3.png')
    grafico(df_form, 'nationality', dcc_country, size_inches=(9,3),filename='fig_4.png')
    grafico(df_form, 'area', dcc_ocde_area, size_inches=(6,3),filename='fig_5.png')
    

#////////////////////////////////////////////////
#//                   MAIN                     //
#////////////////////////////////////////////////

if __name__=='__main__':

    umbral = 0.75
    mode = 0         # 0: significa que tenemos 4 clases de emociones
                     # 1: significa que tenemos 2 clases (positivo o negativo)               
    


    analisis(mode, umbral)
    
    