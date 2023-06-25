function depthInpaint = readDepth(depthpath)         
    depthVis = imread(depthpath);  % 读取一个深度图像
    % 利用 bitor 或运算、bitshift 位移运算, -n 为右移, n 为左移
    % depthVis 为 uint16 类型数据
    % 深度相机的一个像素用 16 位存储
    % 第15位 (最高位) 为标志位, 不用做深度计算;
    % 第 14 ~ 3 位: 深度图像数据, 即距离, 以 mm 毫米为单位
    % 第 2 ~ 0 位: 深度图中人的 ID (PlayerID)
    % Kinect 可以获取两种格式的深度图
    % 不带用户 ID 的深度数据, 也是存储在 16 位的变量中, 但是只使用了前 12 位, 用来表示深度
    % 带用户 ID 的深度数据, 16 位, 前 3 位表示用户 ID, 最多可以识别 6 个人, 后 13 位表示深度
    depthInpaint = bitor(bitshift(depthVis,-3), bitshift(depthVis,16-3));  % FEDC BA98 7654 3210 --> 210F EDCB A987 6543
    depthInpaint = double(depthInpaint)/1000;  % 换算成 m 米为单位
end
