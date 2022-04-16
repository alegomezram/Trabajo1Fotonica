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
R=@(theta) h*k0*n1*cos(theta);
S=@(theta) pi+2*atan((sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))/(n1*cos(theta)));

%Plot
theta=linspace(0,pi/2,10);
plot(theta,R(theta),theta,S(theta)), grid on
legend('R','S','Location','best')