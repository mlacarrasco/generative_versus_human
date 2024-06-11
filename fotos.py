import cv2
import matplotlib.pyplot as plt

lista_nombres = [ f'imagen_{i}' if i>=10 else f'imagen_0{i}'  for i in range(1,21)]

plt.figure()
for count, id_image in enumerate(lista_nombres):
    
    print(id_image)
    
    img = cv2.imread(f'imagenes/{id_image}.png')
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

    for i in range(4):
        new_filename = f'painting_{count+1}_v{i+1}.png'

        eje_y = (i*189)+8
        eje_x = 8
        sub_img = img[eje_x:eje_x+156, eje_y:eje_y+156]
        fil, col, _ = sub_img.shape
        dim_big = [fil*10,col*10]
        sub_img =  cv2.resize(sub_img,dim_big, interpolation=cv2.INTER_CUBIC )
        fil, col, _ = sub_img.shape
        dim_low = [fil//8,col//8]
        sub_img =  cv2.resize(sub_img,dim_low, interpolation=cv2.INTER_CUBIC )
        sub_img = cv2.cvtColor(sub_img, cv2.COLOR_RGB2BGR)
        cv2.imwrite(f'imagenes/{new_filename}', sub_img)
        
plt.imshow(sub_img)
plt.show()