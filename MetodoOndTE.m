clc, close all, clear all

% Método de rayos
% modos TE

%Parámetros
%Todas las unidades en um
n1=1.5;  %core
n2=1;    %cladding
h=1;     %grosor del core
lambda=1; %longitud de onda
k0=2*pi/lambda;  %numero de onda


%Ecuación de dispersión
beta=@(theta) k0*n1*sin(theta);
gammax=sqrt(beta.^2 -(n2^2)*(k0^2));
kx=sqrt((n1^2)*(k0^2) -beta.^2);
R=@(theta) (h/2)*k0.*cos(theta);
S0=@(theta) atan(gammax./kx);
S1=@(theta) pi + atan(gammax./kx);
S2=@(theta) 2*pi + atan(gammax./kx);
S3=@(theta) 3*pi + atan(gammax./kx);

%Plot
theta=linspace(0,pi/2,1000);
figure('Name','Modos TE'), plot(theta,R(theta),theta,S0(theta),theta,S1(theta), ...
    theta,S2(theta),theta,S3(theta),'LineWidth',1.5), grid on
legend('R','S(m=0)','S(m=1)','S(m=2)','S(m=3)','Location','best')
title('Modos TE')
xlabel('theta [rad]') 
ylabel('R(θ),S(θ)')
% 