
%*******************  ERROR  FILE ***************
time = 0.000000;
flag = 10;

while flag > 0

[p, cmap] = imread('lena.bmp');

image(p); colormap(cmap); axis image off
    pause;
    
    t0 = clock;  
    
    p = double(p);
    u = 3.99999999;
   
    x = checksum(p);

    i = 1;
    j = 256;
    r = 1;
    q = 256;
    
    round = 1;
    
   while round > 0 
       
       hflag = zeros(1, 256);                                  
       vflag = zeros(1, 256);
       i = 1;
       j = 256;
       r = 1;
       q = 256;
       
       while (i < j) && (r < q) %DO NOT use "NOT EQUAL" here !
           x = u * x * (1 - x);
           m = i + floor(x * (256 - i - (256 - j)));
           n = j - floor(x * (256 - (256 - j) - i));
           x = u * x * (1 - x);
           t = r + floor(x * (256 - r - (256 - q)));
           s = q - floor(x * (256 - (256 - q) - r));
        

           k1 = mod( m, 256);
           k2 = mod( k1 + 128, 256);
           k3 = mod( 3*n, 256);
           k4 = mod( k3 + 128, 256);
           k5 = mod( 5*t, 256);
           k6 = mod( k5 + 128, 256);
           k7 = mod( 7*s, 256);
           k8 = mod( k7 + 128, 256);
           
%            k1
%            k2
%            k3
%            k4
%            k5
%            k6
%            k7
%            k8
           

            if (m > i) && (n < j)
                while (hflag(m) == 1) && (m ~= i)
                    m = m - 1;
                end;
                if m ~= i
                    temp(1:256) = bitxor(p(i, :), k1);
                    p(i, :) = bitxor(p(m, :), k2);
                    p(m, :) = temp(1:256);
                    hflag(m) = 1;
                    hflag(i) = 1;
                else 
                    p(i, :) = bitxor(p(i, :), k1);
                    hflag(i) = 1;
                end;
            
                while (hflag(n) == 1) && (n ~= j)
                    n = n + 1;
                end;
                if n ~= j
                    temp(1:256) = bitxor(p(j, :), k3);
                    p(j, :) = bitxor(p(n, :), k4);
                    p(n, :) = temp(1:256);
                    hflag(n) = 1;
                    hflag(j) = 1;
                else 
                    p(j, :) = bitxor(p(j, :), k3);
                    hflag(j) = 1;
                end;
            end;
        
            if (t > r) && (s < q)
                while (vflag(t) == 1) && (t ~= r)
                    t = t - 1;
                end;
                if t ~= r
                    temp(1:256) = bitxor(p(:, r), k5);
                    p(:, r) = bitxor(p(:, t), k6);
                    p(:, t) = temp(1:256);
                    vflag(t) = 1;
                    vflag(r) = 1;
                else
                    p(:, r) = bitxor(p(:, r), k5);
                    vflag(r) = 1;
                end;
            
                while (vflag(s) == 1) && (s ~= q)
                    s = s + 1;
                end;
                if s ~= q
                    temp(1:256) = bitxor(p(:, q), k7);
                    p(:, q) = bitxor(p(:, s), k8);
                    p(:, s) = temp(1:256);
                    vflag(s) = 1;
                    vflag(q) = 1;
                else
                    p(:, q) = bitxor(p(:, q), k7);
                    vflag(q) = 1;
                end;
            end;

            i = i + 1;
            j = j - 1;
            r = r + 1;
            q = q - 1;

        end;
        round = round - 1;
   end;


    p = uint8(p);
    fprintf('Cost time : \n');
    etime(clock,t0)
    time = time + etime(clock,t0)
%     image(p); colormap(cmap); axis image off
%     pause;


% H = entropy(p, 256)

flag = flag - 1;
end;

time = time / 10
imwrite(p, 'lena_c.bmp', 'bmp');
