function [score]=PROJECTT(SIM,LD)

% projectdisease=simlncrnala*asdisease;  %矩阵相乘
 projectT=SIM*LD;  %矩阵相乘
 [nnc,nd]=size(LD);
      for i=1:nd
  p=LD(:,i);
   if(norm(p)~=0)
%   projectdisease(:,i)=projectdisease(:,i)/1;  %投影
    projectT(:,i)=projectT(:,i)/norm(p);  % 如果1改成
  %  norm(p)，就变成了投影，不再是矩阵相乘
   end
      end 
score=projectT;

end


