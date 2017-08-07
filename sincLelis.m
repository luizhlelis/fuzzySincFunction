% Exercicio computacional 1 - Luiz Henrique Silva Lelis

% Funcao sinc real
x = 0:pi/1000:2*pi;
y = sinc(x);

% Funcoes de pertinencia
mi1 = trimf(x, [-2.5 0.72 1.951]);
mi2 = trimf(x, [0.72 1.951 2.969]);
mi3 = trimf(x, [1.951 2.969 3.981]);
mi4 = trimf(x, [2.969 3.981 4.986]);
mi5 = trimf(x, [3.981 4.986 6.283]);
mi6 = trimf(x, [4.986 5.884 7.081]);

% Funcoes dos consequentes
y1 = -0.85*x + 1;
y2 = 0.34*x - 0.70;
y3 = -0.22*x + 0.66;
y4 = 0.16*x - 0.65;
y5 = -0.13*x + 0.65;
y6 = 0.12*x - 0.72;

yFuzzy = (mi1.*y1+mi2.*y2+mi3.*y3+mi4.*y4+mi5.*y5+mi6.*y6)./(mi1+mi2+mi3+mi4+mi5+mi6);

figure(1)
plot(x,y);
hold on
plot(x, yFuzzy, 'r');
xlabel('x');
ylabel('sinc(x)');
legend('Função sinc(x) Real','Função sinc(x) modelo Fuzzy');
title('Função sinc(x) Real e Aproximada');

% Calculo do erro
mse = 0;
for i = 1:1000
    mse = mse + (y(i)-yFuzzy(i))^2;
end

mse = mse/1000

ydif = y - yFuzzy;
ydif = yFuzzy.*ydif;

figure(2)
plot(x, ydif);
xlabel('x')
ylabel('Erro quadrático médio')
title('Erro de aproxmação Fuzzy em relação à função sinc(x) real')

