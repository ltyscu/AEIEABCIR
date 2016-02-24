function y = NCML( x, e, b)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
s = size(x);
y = zeros(s);
for i = 1 : s(2)
    j = mod(i, 8) + 1;
    y(i) = (1-e) * tent(x(i), b) + e * tent(x(j), b);
end

end

