function x=randrow(v)
% �������е�����û�
% x=randrow(v)������v������������ŵ�x

%L.J. Hu 8-17-1999

[m,n]=size(v);
v=[randperm(m)',v];
v=sortrows(v);
x=v(:,2:(n+1));
