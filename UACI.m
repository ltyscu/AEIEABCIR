function [uaci]=UACI(f1,f2)
%ͳһƽ���仯�̶ȣ���ʾ������ͼ����һ�����ص�仯ʱ�����õ�����ͼ����ԭ����ͼ��
%��Ƚϣ�����ֵ�������ı仯ռ����Ҷ�ֵ�ı���
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