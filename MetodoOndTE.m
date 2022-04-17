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

%PARES

%Ecuación de dispersión
% beta=@(theta) k0*n1*sin(theta);
% gammax=sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2));
% kx=sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2);
R=@(theta) h*k0*n1.*cos(theta);
S0=@(theta) -2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
S1=@(theta) pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
S2=@(theta) 2*pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
S3=@(theta) 3*pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% 
% %Plot
% theta=linspace(0,pi/2,1000);
% figure('Name','Modos TE'), plot(theta,R(theta),theta,S0(theta),theta,S1(theta), ...
%     theta,S2(theta),theta,S3(theta),'LineWidth',1.5), grid on
% legend('R','S(m=0)','S(m=1)','S(m=2)','S(m=3)','Location','best')
% title('Modos TE')
% xlabel('theta [rad]') 
% ylabel('R(θ),S(θ)')

% Ecuación de dispersión
% syms theta
% r=h*k0*n1.*cos(theta);
% s0=-2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% s1=pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% s2=2*pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% s3=3*pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% 
%Método de Newton para hallar las soluciones (intersecciones de las gráficas)
% f = r-s1;
% df = diff(f)
% f=@(theta) h*k0*n1.*cos(theta) -3*pi +2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% df=@(theta) - (2*((9*pi^2*cos(theta)*sin(theta))/((9*pi^2*sin(theta)^2 - 2778046668940015/70368744177664)^(1/2)*(3125302502557517/35184372088832 - 9*pi^2*sin(theta)^2)^(1/2)) + (9*pi^2*cos(theta)*sin(theta)*(9*pi^2*sin(theta)^2 - 2778046668940015/70368744177664)^(1/2))/(3125302502557517/35184372088832 - 9*pi^2*sin(theta)^2)^(3/2)))/((9*pi^2*sin(theta)^2 - 2778046668940015/70368744177664)/(9*pi^2*sin(theta)^2 - 3125302502557517/35184372088832) - 1) - 3*pi*sin(theta);
% p0= 1;
% delta=1e-6;
% epsilon=1e-6;
% max=20;
% [p0, err, k, y] = newton(f, df, p0, delta, epsilon, max) 


%IMPARES

%Ecuación de dispersión
% beta=@(theta) k0*n1*sin(theta);
% gammax=sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2));
% kx=sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2);
R=@(theta) h*k0*n1.*cos(theta);
S0=@(theta) -2.*atan((sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2))./(sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2))));
S1=@(theta) pi -2.*atan((sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2))./(sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2))));
S2=@(theta) 2*pi -2.*atan((sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2))./(sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2))));
S3=@(theta) 3*pi -2.*atan((sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2))./(sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2))));
% 
% %Plot
% theta=linspace(0,pi/2,1000);
% figure('Name','Modos TE'), plot(theta,R(theta),theta,S0(theta),theta,S1(theta), ...
%     theta,S2(theta),theta,S3(theta),'LineWidth',1.5), grid on
% legend('R','S(m=0)','S(m=1)','S(m=2)','S(m=3)','Location','best')
% title('Modos TE')
% xlabel('theta [rad]') 
% ylabel('R(θ),S(θ)')

% Ecuación de dispersión
% syms theta
% r=h*k0*n1.*cos(theta);
% s0=-2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% s1=pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% s2=2*pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% s3=3*pi - 2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% 
%Método de Newton para hallar las soluciones (intersecciones de las gráficas)
% f = r-s1;
% df = diff(f)
% f=@(theta) h*k0*n1.*cos(theta) -3*pi +2.*atan((sqrt((k0*n1*sin(theta)).^2 -(n2^2)*(k0^2)))./(sqrt((n1^2)*(k0^2) -(k0*n1*sin(theta)).^2)));
% df=@(theta) - (2*((9*pi^2*cos(theta)*sin(theta))/((9*pi^2*sin(theta)^2 - 2778046668940015/70368744177664)^(1/2)*(3125302502557517/35184372088832 - 9*pi^2*sin(theta)^2)^(1/2)) + (9*pi^2*cos(theta)*sin(theta)*(9*pi^2*sin(theta)^2 - 2778046668940015/70368744177664)^(1/2))/(3125302502557517/35184372088832 - 9*pi^2*sin(theta)^2)^(3/2)))/((9*pi^2*sin(theta)^2 - 2778046668940015/70368744177664)/(9*pi^2*sin(theta)^2 - 3125302502557517/35184372088832) - 1) - 3*pi*sin(theta);
% p0= 1;
% delta=1e-6;
% epsilon=1e-6;
% max=20;
% [p0, err, k, y] = newton(f, df, p0, delta, epsilon, max) 