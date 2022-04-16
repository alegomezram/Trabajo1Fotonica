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
R=@(theta) h*k0*n1.*cos(theta);
S0=@(theta) 2.*atan((sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
S1=@(theta) pi + 2.*atan((sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
S2=@(theta) 2*pi + 2.*atan((sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
S3=@(theta) 3*pi + 2.*atan((sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));

%Plot
theta=linspace(0,pi/2,1000);
figure('Name','Modos TE'), plot(theta,R(theta),theta,S0(theta),theta,S1(theta), ...
    theta,S2(theta),theta,S3(theta),'LineWidth',1.5), grid on
legend('R','S0','S1','S2','S3','Location','best')
title('Modos TE')
xlabel('theta [rad]') 
ylabel('R,S')

