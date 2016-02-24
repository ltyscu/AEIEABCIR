function [uaci]=UACI(f1,f2)
%统一平均变化程度，表示当明文图像发生一个像素点变化时，所得的密文图像与原密文图像
%相比较，像素值所发生的变化占整体灰度值的比率
[M, N] = size(f1);
% for i = 1 : M * N
%         
%     c= c + abs(double(f1(i)) - double(f2(i)));
%     
% end
sum = 0;
for i = 1 : M
    for j = 1 : N
        sum = sum + abs( f1(i, j) - f2(i, j) );
    end;
end;
uaci = double(sum) / (255 * M * N);