import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

patterns = [ "o.o", "///","ooo", "oO", "OO", 'xxxx', '//////', '..o','....']

font = {'family': 'monospace',
        'color':  'tomato',
        'weight': 'light',
        'size': 8,
        }
plt.rcParams['font.family'] = 'monospace'
plt.rcParams['font.size']= 9.5
 
#////////////////////////////////////////////////////////////////////////////////////////////////////
def graficos(df,size_inches,title):
    
    fig = plt.figure(dpi=180)    
    fig.set_size_inches(size_inches)
    ax1 = fig.add_subplot(111)
    ax1.grid(color='gray', alpha=0.2, linestyle=':',axis='y', linewidth=0.8,zorder=0)

    for i,col in enumerate(df.keys()):
        height=df[col]
        x = np.arange(0,4)
        ax1.bar(x=x+i*0.25, 
                height = height, 
                width=0.2,
                color='white', 
                edgecolor='gray', 
                hatch=patterns[i],lw=0.5,label=col, zorder=1)
        for x,y in enumerate(height.values):
            ax1.text(y =y+0.01, x= x+i*0.25-0.1, s=f'{y}',fontdict= font )
        
        
    x = np.arange(0,4)+0.1
    ax1.set_ylim(0,1)
    plt.yticks(np.linspace(0,1,11))
    ax1.set_xticks(ticks=x,labels= df[col].keys())   
    plt.legend(loc='upper right')
    plt.title(title)
    plt.ylabel('F1-Score')
    
    plt.tight_layout()
    plt.savefig(f'graficos/fig_{title}.png')
    #plt.show()
    
    return 0


#////////////////////////////////////////////////
#//                   MAIN                     //
#////////////////////////////////////////////////
if __name__=='__main__':
        
    genre = {"Happiness":[0.63,0.73],
            "Enterteinment":[0.72,0.83],
            "Fear":[0.76, 0.87],
            "Sadness":[0.70,0.78]
    }

    ocde = {"Happiness":[0.62,0.73],
            "Enterteinment":[0.70,0.81],
            "Fear":[0.70,0.86],
            "Sadness":[0.63,0.81]
    }

    country = {"Happiness":[0.61,0.77],
            "Enterteinment":[0.65,0.86],
            "Fear":[0.78,0.92],
            "Sadness":[0.68,0.80]
    }
    
    study = {"Happiness":[0.61,0.68],
            "Enterteinment":[0.65,0.75],
            "Fear":[0.89,0.82],
            "Sadness":[0.76,0.76]
    }
    
   

    size_inches=(8,4)
    
    df_genre = pd.DataFrame(genre, index=['Female','Male']).T
    df_ocde = pd.DataFrame(ocde, index=['Social Sciences','Engineering']).T
    df_country = pd.DataFrame(country, index=['Spain','Chile']).T
    df_study = pd.DataFrame(study, index=['Postgraduate','Graduate']).T

    print(df_genre)
    print(df_ocde)
    print(df_country)
    
    graficos(df_genre,size_inches, title='Genre')
    graficos(df_ocde,size_inches, title='Study area')
    graficos(df_country,size_inches, title='Country')
    graficos(df_study,size_inches, title='Study_level')
