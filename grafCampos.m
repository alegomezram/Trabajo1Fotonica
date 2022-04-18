clc, close all, clear all

%Gráfica de campo eléctrico
%Parámetros
%Todas las unidades en um
n1=1.5;  %core
n2=1;    %cladding
h=1;     %grosor del core
lambda=1; %longitud de onda
k0=2*pi/lambda;  %numero de onda

%modos TE
theta=1.309585;   %m=0 par
% theta=1.038322; %m=1 impar
% theta=0.765508; %m=2 par

%modos TM
% theta=1.272993;   %m=0 par
% theta=0.969928; %m=1 impar
% theta=0.742425; %m=2 par

beta= k0*n1*sin(theta);
gamma_x=sqrt((beta).^2 -(n2^2)*(k0^2));
k_x=sqrt((n1^2)*(k0^2) -(beta).^2);

%soluciones pares
A1=@(x) cos(k_x*(h/2)).*exp(-gamma_x.*(abs(x)-(h/2)));
A2=@(x) cos(k_x.*x);

%soluciones impares
% A1=@(x) sin(k_x*(h/2)).*(x/(abs(x))).*exp(-gamma_x.*(abs(x)-(h/2)));
% A2=@(x) sin(k_x.*x);

%Plot
x1=linspace(-2,-0.5,1000);
x2=linspace(-0.5,0.5,1000);
x3=linspace(0.5,2,1000);
figure('Name','Campo eléctrico'), plot(x1,A1(x1),x2,A2(x2),x3,A1(x3),'LineWidth',1.5), grid on
legend('x<-h/2','-h/2≤x≤h/2','x>h/2','Location','best')
title('Modo TE m=2 (par)')
xlabel('x: longitud transversal de la guía de onda [um]') 
ylabel('E(x) [V/m]')