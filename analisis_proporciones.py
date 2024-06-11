import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

folder = 'data/proporciones/'
patterns = [ "o.o", "o.","ooo", "oO", "OO", 'xxxx', '//////', '..o','....']
files = ['amusement', 'contentment','fear','sadness']
files = map(lambda f:f+'.txt',files)
font = {'family': 'monospace',
        'color':  'tomato',
        'weight': 'light',
        'size': 8,
        }
plt.rcParams['font.family'] = 'monospace'
plt.rcParams['font.size']= 9.0
    
    

for i,reg  in enumerate(files):
    df = pd.read_table(folder+reg)
    
    x_bar = np.arange(0,len(df['Proporcion']))
    ibar = df['Imagen']
    values = df['Proporcion'].to_numpy()
    labels_y = [f'{i*100:.0f}%' for i in np.linspace(0,1,11)]
    fig = plt.figure(dpi=150)
    fig.set_size_inches(13,4)
    plt.ylim((0,1))
    plt.yticks(np.linspace(0,1,11),labels=labels_y)
    
    plt.title(reg)
    for i, val in enumerate(values):
        pct= val*100
        plt.text(y = val+0.01, x = x_bar[i]-0.25, s=f'{pct:.1f}%',fontdict= font )
        
        
    plt.bar(x=ibar,height= df['Proporcion'],
                width=0.5, 
                label=ibar, 
                hatch=patterns[6],
                color='white',
                fill=True, 
                edgecolor='gray',
                lw=0.5, 
                zorder = 0)
    
    
        
    plt.bar(x=ibar,
            height= df['Proporcion'], 
            width=0.5,
            color='none', 
            edgecolor='black',
            alpha=0.2,
            fill=True,
            zorder=1, 
            lw=1.)
    
    plt.grid(color='gray', alpha=0.2, linestyle=':',axis='y')
    plt.tight_layout()
    plt.savefig(f'graficos/proporciones_{reg[:-4]}.png')
    plt.show()
    
