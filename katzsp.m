
clear;
clc;

load('data352.mat');    
 %LL:lncRNA functional similarities
 %DD:disease similarities
 para=0.1;%

 omega=0.5;%
 zeta=1-omega;
 
 nl=size(LL,1);         %nm: No. of lnRNAs
 nd=size(DD,1);         %nd: No. of diseases

ddfs=getSimilarityDisease_1(LD',DD);
LL1=miRNASS( LD, DD );
llfs=getSimilarityRNA_1(LD',LL1);

katzLD=katzbeta(para,LD,llfs,ddfs);


  ldpl= PROJECTT(llfs,katzLD);
  ldpd= PROJECTT(ddfs,katzLD');
  

katzsp=ldpl*omega+ldpd'*zeta;



  
  
  
  
  
  
  
  
  
