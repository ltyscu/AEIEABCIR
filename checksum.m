function sum = checksum(p)
% p = imread('lena3.bmp');
% p = imread('lena4.bmp');
p = uint8(p);
% sum = p(1, 1);
% for i = 2 : 256
%     for j = 2 : 256
%         sum = bitxor(sum, p(i, j));
%     end;
% end;

% xsum = 0.000000;
% for i = 1 : 256
%     xsum = bitxor(xsum, p(i, :));
% end;
% 
% xsum = sum(xsum) / 256;

p = double(p);
sum = 0;
for i = 1 : 256
    for j = 1 : 256
        sum = sum + p(i, j);
    end;
end;

  sum = mod(sum, 256) / 256;
  if sum == 0
      sum = 0.19910504;
  end;