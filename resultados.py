'''
Artículo: Tesis Raúl Dastres
Fecha: 09-01-2024
version 1.1
'''
from sklearn.metrics import classification_report
from sklearn.metrics import cohen_kappa_score
from sklearn.metrics import confusion_matrix, jaccard_score

import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt
import cv2
import krippendorff
from statsmodels.stats import inter_rater as irr

tipo = lambda categoria_real:'+' if categoria_real=='Positive' else '-'
font = {'family': 'monospace',
        'color':  'tomato',
        'weight': 'light',
        'size': 8,
        }
plt.rcParams['font.family'] = 'monospace'
plt.rcParams['font.size']= 12.0


#////////////////////////////////////////////////////////////////////////////////////////////////////
def estadisticas(y_pred, y_true):
    #tomado de https://rowannicholls.github.io/python/statistics/agreement/cohens_kappa.html
    # Confusion matrix
    cm = confusion_matrix(y_true, y_pred)
    # Sample size
    n = np.sum(cm)
    # Expected matrix
    sum0 = np.sum(cm, axis=0)
    sum1 = np.sum(cm, axis=1)
    expected = np.outer(sum0, sum1) / n
    # Number of classes
    n_classes = cm.shape[0]
    # Calculate p_o (the observed proportionate agreement) and
    # p_e (the probability of random agreement)
    identity = np.identity(n_classes)
    p_o = np.sum((identity * cm) / n)
    p_e = np.sum((identity * expected) / n)
    # Calculate Cohen's kappa
    kappa = (p_o - p_e) / (1 - p_e)
    # Confidence intervals
    se = np.sqrt((p_o * (1 - p_o)) / (n * (1 - p_e)**2))
    ci = 1.96 * se * 2
    lower = kappa - 1.96 * se
    upper = kappa + 1.96 * se

    print('/'*50)
    print(
        f'p_o = {p_o}, p_e = {p_e}, kappa = {kappa:.1f}\n',
        f'standard error = {se:.3f}\n',
        f'lower confidence interval = {lower:.3f}\n',
        f'upper confidence interval = {upper:.3f}', sep=''
    )

    print('\n')
    
    #Kalpha = krippendorff.alpha(value_counts= cm,level_of_measurement='nominal')
    #print('krippendorff::',Kalpha)


#////////////////////////////////////////////////////////////////////////////////////////////////////
def analisis(mode, umbral, analysis, genre, ocde_type, country, study_level, verbose=0):
    '''
    mode:  # 0: significa que tenemos 4 clases de emociones
           # 1: significa que tenemos 2 clases (positivo o negativo)               
    umbral: define el porcentaje de valores que están clasificados en una opción
    
    analysis      : define el modo de operación {ocde, genre}
    genre     : sexo  en estudio{femenino, masculino}
    ocde_type : area de estudio según la OCDE
    country   : nombre del pais a analizar
    '''

    #categorias 
    dcc_categorias = {'Contentment':'Positive','Amusement':'Positive','Fear':'Negative','Sadness':'Negative'}
    
    if mode==0:
        dcc_emocion = {'Contentment':0,'Amusement':1,'Fear':2,'Sadness':3}
    else:
        dcc_emocion = {'Contentment':0,'Amusement':0,'Fear':1,'Sadness':1}


    #lectura de datos reales
    df_real = pd.read_csv('data/real.csv')
    df_form = pd.read_csv('data/form_3.csv')
    data_all = df_form.iloc[:,5:]
    
    
    match analysis:
        case 'study':
            print(f' [ Analisis según nivel de estudios ]: {study_level}')
            nivel = df_form.iloc[:,1]
            idx = nivel == study_level
        case 'ocde':
            print(f' [ Analisis según carrera OCDE ]: {ocde_type}')
            ocde = df_form.iloc[:,2]
            idx = ocde ==ocde_type
        case 'genre':
            print(f' [ Analisis según genero ]: {genre}')
            
            genero = df_form.iloc[:,3]
            idx = genero==genre
        case 'country':
            print(f' [ Analisis según pais ]: {country}')
            pais = df_form.iloc[:,4]
            idx = country==pais
        
    print(f'numero de datos: {np.sum(idx)}')
    #datos segmentados según la variable type
    data = data_all[idx]
    
    data.reset_index(inplace=True)
    data = data.iloc[:,1:]

    
    n_evaluators = data.shape[0]
    n_images = data.shape[1]

   
    emociones_matrix = data.replace(dcc_emocion)
    emociones_vector = df_real.replace(dcc_emocion).squeeze()

    # nivel de acuerdo entre la IA y cada usuario
    cohen_sc = np.zeros((n_evaluators,))
    jaccard_sc= np.zeros((n_evaluators,))
    for user in range(n_evaluators):
        cohen_sc[user] = cohen_kappa_score(emociones_vector, emociones_matrix.iloc[user,:])
        jaccard_sc[user] = jaccard_score(emociones_vector, emociones_matrix.iloc[user,:], average='macro')

    print(f'cohen users versus IA:{cohen_sc.mean()}')
    print(f'Jaccard score:{jaccard_sc.mean()}')
    performance = []
    image_list = []
    score_list = []
    categoria_real_list = []
    acum_pos = []
    acum_neg = []

    
    y_pred = []
    y_true = []
    P_row = []
    if mode ==0:
        emotion_M = np.zeros((80,4))
    else:
        emotion_M = np.zeros((80,2))

    for count, obra_id in enumerate(data.columns):
        
        #en las columnas se encuentra el id de la obra
        if verbose: print(f'[ {obra_id} | contador:{count}] ')
        
        #subdata: son las elecciones de las personas del estudio
        #         para una determinada obra
        subdata = data[obra_id]
        n = len(subdata)
        gp = subdata.groupby(subdata)

        #datos reales: corresponde a la clase real simulada por la red neuronal
        clase_real = df_real.iloc[0,count] 
        categoria_real = dcc_categorias[clase_real]
        
        if verbose:
            print('clase real-->',clase_real)       
            print('categoria real-->',categoria_real)
        
        #imagen analizada
        filename = f'imagenes/{obra_id}.png'
        img = cv2.imread(filename)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        
        #datos de encuesta
        keys = list(gp.indices.keys())
        vc = gp.value_counts().to_list()
        total = np.sum(vc)
        
        inner_sum=0
        '''
        for clase in dcc_emocion:
            if clase in keys:
                pos_key = keys.index(clase)
                inner_sum += vc[pos_key]**2
        '''

        #estimación agreement table
        for clase in keys:
            pos_clase = dcc_emocion[clase]
            pos_key = keys.index(clase)
            emotion_M[count, pos_clase] += vc[pos_key]

                

        #p_aux = (inner_sum-total)/(total*(total-1))
        #P_row.append(p_aux)

        #calcular coeficiente Kappa, para determinar el acuerdo
        #extraemos la emoción con mayor cantidad de votos
        #clase_pred = dcc_emocion[keys[np.argmax(vc)]]  #rev.23/mayo
        clase_pred = np.argmax(emotion_M[count,:])
        
        y_pred_aux = clase_pred #list(subdata.replace(dcc_emocion))
        y_pred.append(y_pred_aux)
        y_true_aux = dcc_emocion[clase_real] #[dcc_emocion[clase_real]]*n
        y_true.append(y_true_aux)

        #datos clusterizados por emocion (positivo/negativo)
        #_ sumamos los votos según la emocion de la categoria 
        #_ real/asignada por el computador
        acum = 0
        for ii,emocion in enumerate(keys):
            if dcc_categorias[emocion]==categoria_real:
                acum += vc[ii] 
        
        if categoria_real == 'Positive':
            acum_pos.append(acum/total)
        if categoria_real == 'Negative':
            acum_neg.append(acum/total)
        
        #indice de dato real con dato encuesta
        #indice_correcto = keys.index(clase_real)
        
        #plt.bar(count+1,acum/total)
        performance.append(acum/total)

        if verbose:
            print('predicciones:-->')
            print(keys, vc)
            #print(f'{vc[indice_correcto]}, {(vc[indice_correcto]/total)*100:.2f}%')
            print(f'categoria real: {categoria_real}, porcentaje: {(acum/total)*100:.2f}%')
        
        image_list.append(img)
        score_list.append(acum/total)
        categoria_real_list.append(categoria_real)

        #plt.show()
       #### FIN CICLO POR IMAGENES 
    
    #////////////////////////////////////////////////////
    N_images= df_real.shape[1] #numero de imagenes

    P_row = (np.sum(emotion_M**2, axis=1)-n_evaluators)/(n_evaluators*(n_evaluators-1))
    p_total = emotion_M.sum(axis=0)/(n_evaluators*n_images)
    P = np.sum(P_row)/n_images
    p_e = np.sum(p_total**2)
    kappa = (P-p_e)/(1-p_e)
    
    #fleiss_= irr.fleiss_kappa(emotion_M, method='fleiss')
    Kalpha = krippendorff.alpha(value_counts=emotion_M,level_of_measurement='nominal')
    
    print(' krippendorff score:')
    print(Kalpha)

    #hasta que punto la moda es representacion
    #analizar la concordancia inter observador  


    print(' Kappa score:')
    print(cohen_kappa_score(y_true, y_pred))
    print(confusion_matrix(y_true, y_pred))
    print(classification_report(y_true, y_pred))

    performance = np.array(performance)
    acum_pos = np.array(acum_pos)
    acum_neg = np.array(acum_neg)

    print(f'rendimiento promedio: ', performance.mean())
    print(f'rendimiento Positivo:', acum_pos.mean())
    print(f'rendimiento Negativo:', acum_neg.mean())
    #plt.show()
    
    
    cont_i  =0
    cont_j = 0
    cont = 0

    #obtenemos el orden 
    new_order = np.argsort(score_list)
    nims = np.sum(np.array(score_list)>umbral)   # OBS: cambiar OPERADOR
    
    # dimensiones para la figura de salida
    nrows = np.sqrt(nims).astype(int)
    ncols = nims//nrows
    #convierte una lista en un arreglo de dos dimensiones
    index_i, index_j = np.unravel_index(np.arange(nrows*ncols),(nrows,ncols))

    fig, axs= plt.subplots(ncols=ncols,nrows=nrows, dpi=200)
    fig.set_size_inches(ncols*3,nrows*3)
    
    # graficos
    for count, obra_id in enumerate(data.columns[new_order]):
        clase_real = df_real.iloc[0,new_order[count]] 
        #en las columnas se encuentra el id de la obra
        #print(f'[ {obra_id} ] ')
        if (score_list[new_order[count]])>umbral and cont<ncols*nrows:  # OBS: cambiar OPERADOR

            cont_i = index_i[cont]
            cont_j = index_j[cont]
            axs[cont_i,cont_j].imshow(image_list[new_order[count]],aspect='auto')
            axs[cont_i,cont_j].axis('off')
            #axs[cont_i,cont_j].set_title(f'{clase_real}, [{tipo(categoria_real_list[new_order[count]])}], agreement:{(score_list[new_order[count]])*100:.1f}%', size=9)
            axs[cont_i,cont_j].set_title(f'{clase_real},  AGT:{(score_list[new_order[count]])*100:.1f}%', size=12)
            cont +=1

    plt.axis('off')
    plt.savefig(f'graficos/{analysis}_{genre}.png')
    #fig.tight_layout()

    return y_pred, y_true, performance


#////////////////////////////////////////////////////////////////////////////////////////////////////
def analisis_all(mode, umbral, verbose=0):
    '''
    mode:  # 0: significa que tenemos 4 clases de emociones
           # 1: significa que tenemos 2 clases (positivo o negativo)               
    umbral: define el porcentaje de valores que están clasificados en una opción
    '''
    
    #categorias 
    dcc_categorias = {'Contentment':'Positive','Amusement':'Positive','Fear':'Negative','Sadness':'Negative'}
    
    if mode==0:
        dcc_emocion = {'Contentment':0,'Amusement':1,'Fear':2,'Sadness':3}
        
    else:
        dcc_emocion = {'Contentment':0,'Amusement':0,'Fear':1,'Sadness':1}
    
    inv_emocion = dict(zip(dcc_emocion.values(), dcc_emocion.keys()))

    #lectura de datos reales
    df_real = pd.read_csv('data/real.csv')
    df_form = pd.read_csv('data/form_3.csv')
    data_all = df_form.iloc[:,5:]
    
    #datos segmentados según la variable type
    data = data_all    
    n_evaluators = data.shape[0]
    n_images = data.shape[1]

   
    emociones_matrix = data.replace(dcc_emocion)
    emociones_vector = df_real.replace(dcc_emocion).squeeze()

    # nivel de acuerdo entre la IA y cada usuario
    cohen_sc = np.zeros((n_evaluators,))
    jaccard_sc= np.zeros((n_evaluators,))
    for user in range(n_evaluators):
        cohen_sc[user] = cohen_kappa_score(emociones_vector, emociones_matrix.iloc[user,:])
        jaccard_sc[user] = jaccard_score(emociones_vector, emociones_matrix.iloc[user,:], average='macro')

    print(f'cohen users versus IA:{cohen_sc.mean()}')
    print(f'Jaccard score:{jaccard_sc.mean()}')
    
    performance = []
    image_list = []
    score_list = []
    categoria_real_list = []
    acum_pos = []
    acum_neg = []

    
    y_pred = []
    y_true = []
    P_row = []

    if mode ==0:
        emotion_M = np.zeros((80,4))
    else:
        emotion_M = np.zeros((80,2))

    for count, obra_id in enumerate(data.columns):
        
        #en las columnas se encuentra el id de la obra
        if verbose: print(f'[ {obra_id} ] ')
        
        #subdata: son las elecciones de las personas del estudio
        #         para una determinada obra
        subdata = data[obra_id]
        n = len(subdata)
        gp = subdata.groupby(subdata)

        #datos reales: corresponde a la clase real simulada por la red neuronal
        clase_real = df_real.iloc[0,count] 
        categoria_real = dcc_categorias[clase_real]
        
        if verbose:
            print('clase real-->',clase_real)       
            print('categoria real-->',categoria_real)
        
        #imagen analizada
        filename = f'imagenes/{obra_id}.png'
        img = cv2.imread(filename)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        
        #datos de encuesta
        keys = list(gp.indices.keys())
        vc = gp.value_counts().to_list()
        total = np.sum(vc)
        
        inner_sum=0
        '''
        for clase in dcc_emocion:
            if clase in keys:
                pos_key = keys.index(clase)
                inner_sum += vc[pos_key]**2
        '''

        #estimación agreement table
        for clase in keys:
            pos_clase = dcc_emocion[clase]
            pos_key = keys.index(clase)
            emotion_M[count, pos_clase] += vc[pos_key]

                

        #p_aux = (inner_sum-total)/(total*(total-1))
        #P_row.append(p_aux)

        #calcular coeficiente Kappa, para determinar el acuerdo
        #extraemos la emoción con mayor cantidad de votos
        
        #clase_pred = dcc_emocion[keys[np.argmax(vc)]]
        clase_pred = np.argmax(emotion_M[count,:])
        y_pred_aux = clase_pred #list(subdata.replace(dcc_emocion))
        y_pred.append(y_pred_aux)
        y_true_aux = dcc_emocion[clase_real] #[dcc_emocion[clase_real]]*n
        y_true.append(y_true_aux)

        #datos clusterizados por emocion (positivo/negativo)
        #_ sumamos los votos según la emocion de la categoria 
        #_ real/asignada por el computador
        acum = 0
        for ii,emocion in enumerate(keys):
            if dcc_categorias[emocion]==categoria_real:
                acum += vc[ii] 
        
        if categoria_real == 'Positive':
            acum_pos.append(acum/total)
        if categoria_real == 'Negative':
            acum_neg.append(acum/total)
        
        #indice de dato real con dato encuesta
        #indice_correcto = keys.index(clase_real)
        
        #plt.bar(count+1,acum/total)
        performance.append(acum/total)

        if verbose:
            print('predicciones:-->')
            print(keys, vc)
            #print(f'{vc[indice_correcto]}, {(vc[indice_correcto]/total)*100:.2f}%')
            print(f'categoria real: {categoria_real}, porcentaje: {(acum/total)*100:.2f}%')
        
        image_list.append(img)
        score_list.append(acum/total)
        categoria_real_list.append(categoria_real)

        #plt.show()
       #### FIN CICLO POR IMAGENES 
    
    #////////////////////////////////////////////////////
    #---> graficos de nivel de acuerdo ordenado
    fig = plt.figure(dpi=180)
    props = dict(linestyle='-', linewidth=1, color='blue')
    fig.set_size_inches(6,4)
    ax1 = fig.add_subplot(111)
    x = np.linspace(0,80, num=len(acum_pos))   
    ax1.plot(x,np.sort(acum_pos), color='blue', linewidth=0.5)
    ax1.bar(x=x,height= np.sort(acum_pos), label='Positive ', color='blue', alpha=0.2)
    
    ax1.plot(x+1,np.sort(acum_neg), color='red', linewidth=0.5)
    ax1.bar(x=x+1,height= np.sort(acum_neg), label='Negative',color='red', alpha=0.2)
    ax1.set_xlabel('generated image')
    ax1.set_ylabel('agreement percentage')
    plt.yticks(np.linspace(0,1,11))
    plt.grid(color='gray', alpha=0.2, linestyle='--')
    plt.legend()
    plt.tight_layout()
    plt.savefig(f'graficos/relacion_positivo_negativo.png')
    plt.show()
    #--->

    
    N_images= df_real.shape[1] #numero de imagenes

    P_row = (np.sum(emotion_M**2, axis=1)-n_evaluators)/(n_evaluators*(n_evaluators-1))
    p_total = emotion_M.sum(axis=0)/(n_evaluators*n_images)
    P = np.sum(P_row)/n_images
    p_e = np.sum(p_total**2)
    kappa = (P-p_e)/(1-p_e)
    
    #fleiss_= irr.fleiss_kappa(emotion_M, method='fleiss')
    Kalpha = krippendorff.alpha(value_counts=emotion_M,level_of_measurement='nominal')
    
    print(' krippendorff score:')
    print(Kalpha)

    #hasta que punto la moda es representacion
    #analizar la concordancia inter observador  

    print(' Kappa score:')
    print(cohen_kappa_score(y_true, y_pred))
    
    print(' Confusion Matrix:')
    print(confusion_matrix(y_true, y_pred))
    print(classification_report(y_true, y_pred))

    performance = np.array(performance)
    acum_pos = np.array(acum_pos)
    acum_neg = np.array(acum_neg)

    print(f'rendimiento promedio: ', performance.mean())
    #plt.show()
    
    return y_pred, y_true 


#////////////////////////////////////////////////
#//                   MAIN                     //
#////////////////////////////////////////////////

if __name__=='__main__':

    umbral = 0.9
    mode = 1         # 0: significa que tenemos 4 clases de emociones
                     # 1: significa que tenemos 2 clases (positivo o negativo)               
    analysis = 'country'   # define el tipo de segmentación que vamos a realizar ['study','ocde', 'genre', 'country']

    y_pred, y_true = analisis_all(mode, umbral, verbose=0)
    estadisticas(y_pred, y_true)
    


    study_level = 'Postgraduate'
    genre = 'Female'
    ocde_type ='Engineering'
    country = 'Chile'
    verbose = 0

    print('/'*50)
    print('/'*50)
    
    y_pred , y_true, performance = analisis(mode, umbral, analysis, genre, ocde_type, country, study_level, verbose)
    estadisticas(y_pred, y_true)
    
    print()
    print('-'*50)

    study_level = 'Graduate'
    genre = 'Male'
    ocde_type ='Social Sciences'
    country = 'Spain'
    
    
    y_pred , y_true, performance = analisis(mode, umbral, analysis, genre, ocde_type, country, study_level, verbose)
    estadisticas(y_pred, y_true)

    '''
    fig = plt.figure(dpi=180)
    props = dict(linestyle='-', linewidth=1, color='blue')
    fig.set_size_inches(6,4)
    ax1 = fig.add_subplot(111)
    ax1.bar(np.arange(len(performance)), np.sort(performance),alpha=0.2)
    ax1.set_ylabel('agreement percentage')
    plt.yticks(np.linspace(0,1,11))
    plt.grid(color='gray', alpha=0.2, linestyle='--')
    plt.legend()
    plt.tight_layout()
    plt.savefig(f'graficos/performance.png')
    #plt.show()
    '''
    


