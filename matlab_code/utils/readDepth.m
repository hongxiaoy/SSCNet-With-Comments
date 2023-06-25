function depthInpaint = readDepth(depthpath)         
    depthVis = imread(depthpath);  % 读取一个深度图像
    depthInpaint = bitor(bitshift(depthVis,-3), bitshift(depthVis,16-3));  % 0123 4567 89AB CDEF --> DEF0 1234 5678 9ABC
    depthInpaint = double(depthInpaint)/1000; 
end
