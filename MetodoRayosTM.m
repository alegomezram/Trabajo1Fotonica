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
    theta,S2(theta),theta,S3(theta),'LineWidth',1.5), grid on
legend('R','S(m=0)','S(m=1)','S(m=2)','S(m=3)','S(m=4)','Location','best')
title('Modos TM')
xlabel('theta [rad]') 
ylabel('R(θ),S(θ)')

%Ecuación de dispersión
% syms theta
% r=h*k0*n1.*cos(theta);
% s0=2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
% s1=pi + 2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
% s2=2*pi + 2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
% s3=3*pi + 2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));

%Método de Newton para hallar las soluciones (intersecciones de las gráficas)
% f = r-s0;
% df = diff(f)
f=@(theta) h*k0*n1.*cos(theta)-3*pi -2.*atan(((n1^2)/(n2^2)).*(sqrt((n1^2)*((sin(theta)).^2)-(n2^2)))./(n1.*cos(theta)));
df=@(theta) - 3*pi*sin(theta) - (2*((27*sin(theta))/(8*((9*sin(theta)^2)/4 - 1)^(1/2)) + ...
    (3*sin(theta)*((9*sin(theta)^2)/4 - 1)^(1/2))/(2*cos(theta)^2)))/((9*((9*sin(theta)^2)/4 - 1))/(4*cos(theta)^2) + 1);
p0= 0.7;
delta=1e-6;
epsilon=1e-6;
max=20;
[p0, err, k, y] = newton(f, df, p0, delta, epsilon, max) 