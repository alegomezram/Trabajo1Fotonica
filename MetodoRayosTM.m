clc, close all, clear all

% Método de rayos
% modos TM

%Parámetros
%Todas las unidades en um
n1=1.5;  %core
n2=1;    %cladding
h=1;     %grosor del core
lambda=1; %longitud de onda
k0=2*pi/lambda;  %numero de onda

%Ecuación de dispersión
R=@(theta) h*k0*n1.*cos(theta);
S0=@(theta) 2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
S1=@(theta) pi + 2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
S2=@(theta) 2*pi + 2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
S3=@(theta) 3*pi + 2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
S4=@(theta) 4*pi + 2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));

%Plot
theta=linspace(0,pi/2,1000);
figure('Name','Modos TM'), plot(theta,R(theta),theta,S0(theta),theta,S1(theta), ...
    theta,S2(theta),theta,S3(theta),theta,S4(theta),'LineWidth',1.5), grid on
legend('R','S(m=0)','S(m=1)','S(m=2)','S(m=3)','S(m=4)','Location','best')
title('Modos TM')
xlabel('theta [rad]') 
ylabel('R(θ),S(θ)')
