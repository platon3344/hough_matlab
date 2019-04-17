I=imread('in.jpg');

Ihsv=rgb2hsv(I);
Iv=Ihsv(:,:,3);                    %提取v空间
Ivl=Iv(500:end,:);              %截取下半部
Iedge=edge(Ivl,'sobel');    %边沿检测
Iedge = imdilate(Iedge,ones(3));%图像膨胀

%新建窗口，绘图用
figure (2)
imshow(Iedge);
hold on

%左方直线检测与绘制
%得到霍夫空间
[H1,T1,R1] = hough(Iedge,'Theta',20:0.1:75);

%求极值点
Peaks=houghpeaks(H1,5);

%得到线段信息
lines=houghlines(Iedge,T1,R1,Peaks);

%绘制线段
 for k=1:length(lines)
xy=[lines(k).point1;lines(k).point2];   
plot(xy(:,1),xy(:,2),'LineWidth',4);
 end

 
 %右方直线检测与绘制
[H2,T2,R2] = hough(Iedge,'Theta',-75:0.1:-20);
Peaks1=houghpeaks(H2,5);
lines1=houghlines(Iedge,T2,R2,Peaks1);
for k=1:length(lines1)
xy1=[lines1(k).point1;lines1(k).point2];   
plot(xy1(:,1),xy1(:,2),'LineWidth',4);
end

hold off