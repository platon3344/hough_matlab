I=imread('in.jpg');

Ihsv=rgb2hsv(I);
Iv=Ihsv(:,:,3);                    %��ȡv�ռ�
Ivl=Iv(500:end,:);              %��ȡ�°벿
Iedge=edge(Ivl,'sobel');    %���ؼ��
Iedge = imdilate(Iedge,ones(3));%ͼ������

%�½����ڣ���ͼ��
figure (2)
imshow(Iedge);
hold on

%��ֱ�߼�������
%�õ�����ռ�
[H1,T1,R1] = hough(Iedge,'Theta',20:0.1:75);

%��ֵ��
Peaks=houghpeaks(H1,5);

%�õ��߶���Ϣ
lines=houghlines(Iedge,T1,R1,Peaks);

%�����߶�
 for k=1:length(lines)
xy=[lines(k).point1;lines(k).point2];   
plot(xy(:,1),xy(:,2),'LineWidth',4);
 end

 
 %�ҷ�ֱ�߼�������
[H2,T2,R2] = hough(Iedge,'Theta',-75:0.1:-20);
Peaks1=houghpeaks(H2,5);
lines1=houghlines(Iedge,T2,R2,Peaks1);
for k=1:length(lines1)
xy1=[lines1(k).point1;lines1(k).point2];   
plot(xy1(:,1),xy1(:,2),'LineWidth',4);
end

hold off