[Y,fs] = audioread('aleluya.wav');       
sound(Y);
%%
X = audiorecorder(44100,8,1);
disp('Inicio de grabacion (5s)')
recordblocking(X, 3);
disp('Fin de Grabacion.');
play(X);
grabacion = getaudiodata(X); 
plot(grabacion,'r-');
xlabel('MiliSegundos'); ylabel('Amplitud');

%%
Z= downsample(Y,1);
%UPSAMPLE
sound(Z);
%%
subplot(3,1,1)
 grabacion = grabacion(:,1);
    dt = 1/fs;
    t = 0:dt:(length(grabacion)*dt)-dt;
    plot(t,grabacion,'r-'); ylabel('Amplitud');
    title('Grafica en el tiempo de mensaje subliminal')
    
subplot(3,1,2)
 y = y(:,1);
    dt = 1/fs;
    t = 0:dt:(length(y)*dt)-dt;
    plot(t,y); ylabel('Amplitud');
    title('Cancion')
  
subplot(3,1,3)
 y = y(:,1);
    dt = 1/fs;
    t = 0:dt:(length(y)*dt)-dt;
    plot(t,y,'b-'); xlabel('Segundos'); ylabel('Amplitud');
    title('Cancion con mensaje subliminal')