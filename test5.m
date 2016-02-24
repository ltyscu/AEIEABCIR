i = 1;
j = 256;
r = 1;
q = 256;
x = 0.78125;
u = 3.99999999;
m = zeros(1, 128);
n = zeros(1, 128);
t = zeros(1, 128);
s = zeros(1, 128);

while (i < j) && (r < q) %DO NOT use "NOT EQUAL" here !
    x = u * x * (1 - x);
    m(i) = i + floor(x * (256 - i - (256 - j)));
    n(i) = j - floor(x * (256 - (256 - j) - i));
    %x = u * x * (1 - x);
    t(i) = r + floor(x * (256 - r - (256 - q)));
    s(i) = q - floor(x * (256 - (256 - q) - r));
    
    i = i + 1;
    j = j - 1;
    r = r + 1;
    q = q - 1;
    
end;

m