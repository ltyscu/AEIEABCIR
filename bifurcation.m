clear all; clc;
hold on  
set(0, 'defaultfigurecolor', 'w');
axis([0, 4, 0, 1]);
grid off   

for a = 0 : 0.001 : 4;
x = [0.1234];
u = a;

for n = 2 : 150
    x(n) = u * x(n - 1) * (1 - x(n - 1));
end

for n = 100 : 150              
    plot(a, x(n), 'k', 'markersize', 3);
end

end

title('-------');
xlabel('\fontsize{20}'), ylabel('\fontsize{20}');
set(gca, 'FontSize', 20);