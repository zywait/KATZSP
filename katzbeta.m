
 function pre=katz(para,LD,LL,DD)


%  load('LNCRNA352');
[nl,nd]=size(LD);

   %构建A

   A=zeros(nl+nd);
   A(1:nl,1:nl)=LL;
   A(nl+1:nl+nd,nl+1:nl+nd)=DD;
   A(1:nl,nl+1:nd+nl)=LD;
   A(nl+1:nl+nd,1:nl)=LD';
   I=eye(nl+nd);
   [X,B]=eig(A);
%    max(max(B))
%    norm(A) %norm(A)就是最大特跟么？
   beta=1/max(max(B))*para;

% beta=(1/max(max(B)))*(1/max(max(B)));
   S=inv(I-beta*A)-I;
pre=S(1:nl,nl+1:nd+nl);
 end          

          
