  function AUC=calculatewutu(target, predict)

 [nm,nd]=size(target); 
 B=sort(predict(:));
  B=roundn(B(:),-4);
 THRESHOLD=unique(B);
 k=0;
 for i=1:size(THRESHOLD,1)
     if ~isnan(THRESHOLD(i))
         k=k+1;end
     end
 NTHRESHOLD=size(THRESHOLD,1);
 diedaicishu=k;
for ii=1:diedaicishu
    
    TP(ii)=0;FN(ii)=0;
    TN(ii)=0;FP(ii)=0;
 threshold=THRESHOLD(ii);
 %下面判断所有样本
      for i=1:nm
        for j=1:nd    
            if target(i,j)==0
                if predict(i,j)>=threshold
                    FP(ii)=FP(ii)+1;
                else
                    TN(ii)= TN(ii)+1;
                end
            else
             if target(i,j)==1
                if predict(i,j)>=threshold
                    TP(ii)=TP(ii)+1;
                else
                    FN(ii)= FN(ii)+1;
                end
            end
            
            
        end
    end
    
      end
end 
    
    
    
for ii=1:diedaicishu
 if TP(ii)==0
      if TP(ii)+FN(ii)==0
         TPR(ii)=1;
          else TPR(ii)=0;
    end
      else
          TPR(ii)=TP(ii)/(TP(ii)+FN(ii));
    end
  
     if FP(ii)==0
      if TN(ii)+FP(ii)==0
         FPR(ii)=1;
      else
           FPR(ii)=0;
      end
                else
          FPR(ii)=FP(ii)/(TN(ii)+FP(ii));
      end
end

%计算 presicion、recall等值

for i=1:diedaicishu
   if TP(i)==0
       if TP(i)+FP(i)==0  
          presicion(i)=1;
       else
            presicion(i)=0;
       end
       if TP(i)+FN(i)==0
            recall(i)=1;
       else
                   recall(i)=0;
       end
   else     
           
       presicion(i)=TP(i)/(TP(i)+FP(i));
   recall(i)=TP(i)/(TP(i)+FN(i));
   end
end
%计算AUC
[BFPR,IX] = sort(FPR);% 重新排序
for i=1:diedaicishu
    BTPR(i)=TPR(IX(i));
end

% AUChigh=0;
% for i=2:diedaicishu
% AUChigh=AUChigh+(BFPR(i)-BFPR(i-1))*BTPR(i);
% end


% 
% AUClow=0;
% 
% for i=2:diedaicishu %取低值
% AUClow=AUClow+(BFPR(i)-BFPR(i-1))*BTPR(i-1);
% end
% 
% 
% 
 AUCmiddle=0;
% 
for i=2:diedaicishu %取中值
 AUCmiddle=AUCmiddle+(BFPR(i)-BFPR(i-1))*(BTPR(i)+BTPR(i-1))/2;
end

% 
% figure(1)
% % 画图
% plot(FPR,TPR,'-.b');
% title('ROC');
% ylabel('false positives');
% xlabel('true positives');
% % 
% % figure(2)
% % plot(recall,presicion,'--k');
% % 
% % 
%   AUC1=[AUClow AUCmiddle AUChigh]
 AUC= AUCmiddle;
%  save dngsmdaorphan225 FPR TPR;
