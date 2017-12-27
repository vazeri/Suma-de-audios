%VAZQUEZ GONZALEZ ERICK 
voz = audioread('01.wav',[1,440969]);     
fs= 44100;
sound(voz,fs);
subplot(1,1,1)
 voz = voz(:,1);
    dt = 1/fs;
    t = 0:dt:(length(voz)*dt)-dt;
    plot(t,voz,'r-'); ylabel('Amplitud');
    title('Grafica en el tiempo de mensaje subliminal')    
%%
Canal_Izq = voz(:,1);                                           %columna izquierda
Transpuesta = Canal_Izq.';                                      %transpuesta
Vs = downsample(Transpuesta, 2);                                %submuestreo
Vi = upsample(Vs, 2);                                           %sobremuestreo al vector submuestreado (se le agregan ceros intercalados en las muestras)
musica= audioread('02.wav',[1,440969]);                        
sound(musica,fs);

subplot(1,1,1)
 musica = musica(:,1);
    dt = 1/fs;
    t = 0:dt:(length(musica)*dt)-dt;
    plot(t,musica,'r-'); ylabel('Amplitud');
    title('Musica de ambiente')
    
%%
Canal_Der = musica(:,1);                    %Se le llama Derecho pero es izquierdo                                  
Transpuesta_2 = Canal_Der.';   

v_s2 = downsample(Transpuesta_2,2); 
v_i2 = upsample(v_s2,2);

voz_mezcla = [Vi 0];                        %agrega un 0 al final al vector
musica_mezcla = [0 v_i2];                   %agrega un 0 al principio al vector
cf = 1*voz_mezcla + 1*musica_mezcla;        %suma de los dos vectores submuestreados, 

sound(cf,fs);

subplot(3,1,1)
 voz = voz(:,1);
    dt = 1/fs;
    t = 0:dt:(length(voz)*dt)-dt;
    plot(t,voz,'g-'); ylabel('Amplitud');
    title('Grafica en el tiempo de mensaje subliminal')
    
subplot(3,1,2)
 musica = musica(:,1);
    dt = 1/fs;
    t = 0:dt:(length(musica)*dt)-dt;
    plot(t,musica,'b-'); ylabel('Amplitud');
    title('Musica de ambiente')
    
subplot(3,1,3)
    dt = 1/fs;
    t = 0:dt:(length(cf)*dt)-dt;
    plot(t,cf,'r-'); ylabel('Amplitud');
    title('Musica de ambiente')

%%
cf = 1*voz_mezcla + 0.2*musica_mezcla;      %suma de los dos vectores submuestreados, 

sound(cf,fs);

subplot(3,1,1)
 voz = voz(:,1);
    dt = 1/fs;
    t = 0:dt:(length(voz)*dt)-dt;
    plot(t,voz,'g-'); ylabel('Amplitud');
    title('Grafica en el tiempo de mensaje subliminal')
    
subplot(3,1,2)
 musica = musica(:,1);
    dt = 1/fs;
    t = 0:dt:(length(musica)*dt)-dt;
    plot(t,musica,'b-'); ylabel('Amplitud');
    title('Musica de ambiente')
    
subplot(3,1,3)
    dt = 1/fs;
    t = 0:dt:(length(cf)*dt)-dt;
    plot(t,cf,'r-'); ylabel('Amplitud');
    title('Musica de ambiente')
