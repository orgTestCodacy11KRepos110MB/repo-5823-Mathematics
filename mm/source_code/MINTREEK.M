function [Wt,Pp]=mintreek(n,W)
%ͼ������С������Kruskal�㷨 ����ͼ���� M-����
%��ʽ [Wt,Pp]=mintreek(n,W)��nΪͼ������,WΪͼ�Ĵ�Ȩ�ڽӾ�
%   �󣬲����ɱߵ�������֮���Ȩ��inf��ʾ����ʾ��С�������ı߼�
%   ����, WtΪ��С��������Ȩ,Pp(:,1:2)Ϊ��С�������ߵ�������,
%   Pp(:,3)Ϊ��С�������ı�Ȩ,Pp(:,4)Ϊ��С�������ߵ����;
%��ͼ,��ɫ����Ϊ��С��������ͼ;
%����
%   n=6;w=inf*ones(6);
%   w(1,[2,3,4])=[6,1,5];w(2,[3,5])=[5,3];
%   w(3,[4,5,6])=[5,6,4];w(4,6)=2;w(5,6)=6;
%   [a,b]=mintreek(n,w)

% By X.D. Ding June 2000

tmpa=find(W~=inf);[tmpb,tmpc]=find(W~=inf);
w=W(tmpa);e=[tmpb,tmpc];  %w��W�з�infԪ�ذ��й��ɵ�����
                    %e��ÿһ��Ԫ�ر�ʾһ���ߵ�������������         
[wa,wb]=sort(w);E=[e(wb,:),wa,wb];[nE,mE]=size(E);
temp=find(E(:,1)-E(:,2));E=E(temp,:);
P=E(1,:);k=length(E(:,1));
while (rank(E)>0)
  temp1=max(E(1,2),E(1,1));temp2=min(E(1,2),E(1,1));
  for i=1:k;
    if (E(i,1)==temp1), E(i,1)=temp2; end;
if (E(i,2)==temp1), E(i,2)=temp2; end;
  end;
  a=find(E(:,1)-E(:,2));E=E(a,:);
  if (rank(E)>0),P=[P;E(1,:)];k=length(E(:,1)); end;
end;
Wt=sum(P(:,3));Pp=[e(P(:,4),:),P(:,3:4)];
for i=1:length(P(:,3)); %��ʾ����vi���ej
disp(['   ','e',num2str(P(i,4)),' ','(v',...
num2str(P(i,1)),' ','v',num2str(P(i,2)),')']);
end;
% �����ǻ�ͼ����
axis equal; hold on
[x,y]=cylinder(1,n);xm=min(x(1,:)); ym=min(y(1,:));
xx=max(x(1,:)); yy=max(y(1,:));
axis([xm-abs(xm)*0.15,xx+abs(xx)*0.15,ym-abs(ym)*0.15, yy+abs(yy)*0.15]); plot(x(1,:),y(1,:),'ko')
for i=1:n; temp=['  v',int2str(i)];
   text(x(1,i),y(1,i),temp); end;
for i=1:nE; plot(x(1,e(i,:)),y(1,e(i,:)),'b'); end;
for i=1:length(P(:,4));
  plot(x(1,Pp(i,1:2)),y(1,Pp(i,1:2)),'r'); end;
text(-0.35,-1.2,['��С��������ȨΪ',' ',num2str(Wt)]);
title('��ɫ����Ϊ��С������'); axis('off');hold off
