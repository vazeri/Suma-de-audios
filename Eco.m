%%GENERADOR DE REVERBERACION EN PAREDES
%%
[y,fs]=audioread('aleluya.wav');       
sound(y);
 y = y(:,1);
    dt = 1/fs;
    t = 0:dt:(length(y)*dt)-dt;
    plot(t,y,'g-'); xlabel('Segundos'); ylabel('Amplitud');
    title('Grafica en el tiempo del archivo de audio original')
%%
%%ADDICION DE REVERVERACION Y ATENCUACION 
Columna_Izquierda = y(:,1);       
C_I_T = Columna_Izquierda.';               %Transpuesta del vector 
%%
%Amplitud    (coeficientes)
f1=0.97;     %pared                        
f2=0.67;     %vidrio                                        
f3=0.50;     %madera                                        
f4=0.25;     %yeso                                      
%%
%RETARDOS
RET=22050;                    %Valores redondeados 
ret1=2756;           %(1/8)      Ret/8 = 2756.25     
ret11=19294;         %(7/8)    7*Ret/8 = 19293.75   
ret2=5513;           %(1/4)      Ret/4 = 5512.5      
ret22=16537;         %(3/4)    3*Ret/4 = 16537.5    
ret3=8269;           %(3/8)    3*Ret/8 = 8268.75    
ret33=13781;         %(5/8)    5*Ret/8 = 13781.25   
%%
eco1 = [C_I_T zeros(1,RET)] + f1*[zeros(1,ret1) C_I_T zeros(1,ret11)];
eco2 = f2*[zeros(1,ret2) C_I_T zeros(1,ret22)]; 
eco3 = f3*[zeros(1,8269) C_I_T zeros(1,ret33)];
eco4 = f4*[zeros(1,RET/2) C_I_T zeros(1,RET/2)];
%%
cancion_eco =  eco1 + eco2 + eco3 + eco4 ;      %Suma de ecos
sound(cancion_eco, fs);                         %reproduccion de  todos los eco
%%
figure
subplot(5,1,1)     
 cancion_eco2 = cancion_eco(:,1);
    dt = 1/fs;
    t = 0:dt:(length(cancion_eco)*dt)-dt;
    plot(t,cancion_eco,'r-'); 
ylim([-1.5 1.5])
    title('Suma de señales')

subplot(5,1,2)       
 cancion_eco3 = eco1(:,1);
    dt = 1/fs;
    t = 0:dt:(length(eco1)*dt)-dt;
    plot(t,eco1); 
    ylim([-1.5 1.5])
    title('Coeficiente de absorcion 0.97')

    subplot(5,1,3)       
 cancion_eco4 = eco2(:,1);
    dt = 1/fs;
    t = 0:dt:(length(eco2)*dt)-dt;
    plot(t,eco2); 
    ylim([-1.5 1.5])
    title('Coeficiente de absorcion 0.67')
    
    subplot(5,1,4)    
 cancion_eco5 = eco3(:,1);
    dt = 1/fs;
    t = 0:dt:(length(eco3)*dt)-dt;
    plot(t,eco3); 
    ylim([-1.5 1.5])
    title('Coeficiente de absorcion 0.50')
    
        subplot(5,1,5)      
 cancion_eco6 = eco4(:,1);
    dt = 1/fs;
    t = 0:dt:(length(eco4)*dt)-dt;
    plot(t,eco4);
    ylim([-1.5 1.5])
    title('Coeficiente de absorcion 0.25')
