function [score]=PROJECTT(SIM,LD)

% projectdisease=simlncrnala*asdisease;  %�������
 projectT=SIM*LD;  %�������
 [nnc,nd]=size(LD);
      for i=1:nd
  p=LD(:,i);
   if(norm(p)~=0)
%   projectdisease(:,i)=projectdisease(:,i)/1;  %ͶӰ
    projectT(:,i)=projectT(:,i)/norm(p);  % ���1�ĳ�
  %  norm(p)���ͱ����ͶӰ�������Ǿ������
   end
      end 
score=projectT;

end


