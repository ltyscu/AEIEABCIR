[p, cmap] = imread('peppers_c.bmp');

% image(p); colormap(cmap); axis image off
% pause;
%     t0 = clock;  
    
    p = double(p);
    u = 3.99999999;
%       u = 3.99999999 + 0.000000000000001;
   
%     x = checksum(p);
%     x = 0.78125 + 0.0000000000000001;
%     x = 0.78125;
% x = 0.589843750000000 Bird
 x = 0.937500000; %Peppers
%     x = 0.9375 + 0.0000000000000001;
%     x = 0.9375;
    
    %****************************************************************************************************************************
    m = zeros(1, 128);
    n = zeros(1, 128);
    t = zeros(1, 128);
    s = zeros(1, 128);
    k1 = zeros(1, 128);
    k2 = zeros(1, 128);
    k3 = zeros(1, 128);
    k4 = zeros(1, 128);
    k5 = zeros(1, 128);
    k6 = zeros(1, 128);
    k7 = zeros(1, 128);
    k8 = zeros(1, 128); 

    i = 1;
    j = 256;
    r = 1;
    q = 256;
    
    hflag = zeros(1, 256);
    vflag = zeros(1, 256);
       
    while (i < j) && (r < q)
        
        x = u * x * (1 - x);
        
        m_temp = i + floor(x * (256 - i - (256 - j)));
        n_temp = j - floor(x * (256 - (256 - j) - i));
        
        x = u * x * (1 - x);
%         x = x + 0.0000000000000001;
%        u = u + 0.000000000000001;
        
        t_temp = r + floor(x * (256 - r - (256 - q)));
        s_temp = q - floor(x * (256 - (256 - q) - r));
        
        k1(i) = mod( m_temp, 256);
        k2(i) = mod( k1(i) + 128, 256);
        k3(i) = mod( 3*n_temp, 256);
        k4(i) = mod( k3(i) + 128, 256);
        k5(i) = mod( 5*t_temp, 256);
        k6(i) = mod( k5(i) + 128, 256);
        k7(i) = mod( 7*s_temp, 256);
        k8(i) = mod( k7(i) + 128, 256);
        
        while (hflag(m_temp) == 1) && (m_temp > i)
            m_temp = m_temp - 1;
        end;
        if m_temp ~= i
            hflag(m_temp) = 1;
            hflag(i) = 1;
        else
            hflag(i) = 1;
        end;
        m(i) = m_temp;
        
        
        while (hflag(n_temp) == 1) && (n_temp < j)
            n_temp = n_temp + 1;
        end;
        if n_temp ~= j
            hflag(n_temp) = 1;
            hflag(j) = 1;
        else
            hflag(j) = 1;
        end;
        n(i) = n_temp;
        
        while (vflag(t_temp) == 1) && (t_temp > r)
            t_temp = t_temp - 1;
        end;
        if t_temp ~= r
            vflag(t_temp) = 1;
            vflag(r) = 1;
        else
            vflag(r) = 1;
        end;
        t(i) = t_temp;
        
        while (vflag(s_temp) == 1) && (s_temp < q)
            s_temp = s_temp + 1;
        end;
        if s_temp ~= q
            vflag(s_temp) = 1;
            vflag(q) = 1;
        else
            vflag(q) = 1;
        end;
        s(i) = s_temp;
        
        
        i = i + 1;
        j = j - 1;
        r = r + 1;
        q = q - 1;
    end;
    
    %*****************************************************************************************************************************
    
    round = 1;
    
   while round > 0 
       
       i = 128;
       j = 129;
       r = 128;
       q = 129;
       K = 128;
       
       while (i > 0) && (r > 0) && (j <= 256) && (q <= 256) %DO NOT use "NOT EQUAL" here !

                if s(K) ~= q
                    temp(1:256) = bitxor(p(:, q), k8(K));
                    p(:, q) = bitxor(p(:, s(K)), k7(K));
                    p(:, s(K)) = temp(1:256);
                else
                    p(:, q) = bitxor(p(:, q), k7(K));
                end;
                 
                
                if t(K) ~= r
                    temp(1:256) = bitxor(p(:, r), k6(K));
                    p(:, r) = bitxor(p(:, t(K)), k5(K));
                    p(:, t(K)) = temp(1:256);
                else
                    p(:, r) = bitxor(p(:, r), k5(K));
                end;
                
                if n(K) ~= j
                    temp(1:256) = bitxor(p(j, :), k4(K));
                    p(j, :) = bitxor(p(n(K), :), k3(K));
                    p(n(K), :) = temp(1:256);
                else 
                    p(j, :) = bitxor(p(j, :), k3(K));
                end;
                
                
                if m(K) ~= i
                    temp(1:256) = bitxor(p(i, :), k2(K));
                    p(i, :) = bitxor(p(m(K), :), k1(K));
                    p(m(K), :) = temp(1:256);
                else 
                    p(i, :) = bitxor(p(i, :), k1(K));
                end;

            i = i - 1;
            j = j + 1;
            r = r - 1;
            q = q + 1;
            K = K - 1;
        end;
        
        round = round - 1;
   end;


    p = uint8(p);
%     etime(clock,t0)
    image(p); colormap(cmap); axis image off
%     imwrite(p, 'lena_decode.bmp', 'bmp');
%      imwrite(p, 'peppers_decode_u.bmp', 'bmp');
% %   imwrite(p, 'peppers_decode_x.bmp', 'bmp');