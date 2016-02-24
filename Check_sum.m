function sum = Check_sum()
p = imread('lena.bmp');

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