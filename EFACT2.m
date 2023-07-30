clc;clear;format long g
%farakhani imag 1
imagA=imread('lu_1.tif');
figure
c=histeq(imagA);
imshow(c);
%farakhani imag 2
imageB=imread('lu_2.tif');
figure
d=histeq(imageB);
imshow(d);
%find pixel her karbary
U_Ind_2=find(imageB==1);
I_Ind_2=find(imageB==2);
R_Ind_2=find(imageB==3);
A_Ind_2=find(imageB==4);
O_Ind_2=find(imageB==6);
z_Ind_2=find(imageB==0);
%number of picxl cheng
C=imageB-imagA;
D_I=find(C~=0);

DI2=zeros(length(D_I),3);
DI2(:,1)=D_I;
DI2(:,2)=imagA(D_I);
DI2(:,3)=imageB(D_I);

LU=zeros(4,13);
LU=repmat(LU,[187 217]);
%shomaresh tadad her karbary der her ring
for i=1:187
for j=1:217
    
 for ri=1:13
for i_ri=i-ri:i+ri
    
if i_ri<=0 || i_ri>187
 continue
end

for j_ri=j-ri:j+ri
if j_ri<=0 || j_ri>217
  continue
end

if i_ri==i-ri || i_ri==i+ri || j_ri==j-ri || j_ri==j+ri
 if imageB(i_ri,j_ri)==1
 LU{i,j}(1,ri)= LU{i,j}(1,ri)+1;
 elseif imageB(i_ri,j_ri)==2
 LU{i,j}(2,ri)= LU{i,j}(2,ri)+1;
elseif imageB(i_ri,j_ri)==3
 LU{i,j}(3,ri)= LU{i,j}(3,ri)+1;
   elseif imageB(i_ri,j_ri)==4
   LU{i,j}(4,ri)= LU{i,j}(4,ri)+1;
end
end
end
end
end
end
end

% Urban
U_D=DI2(DI2(:,3)==1,1);
FU=zeros(4,13);
FU=repmat(FU,[1,length(U_D)]);
FUMean=zeros(4,13);

D=[8,16,24,32,40,48,56,64,72,80,88,96,104];
for i=1:length(U_D)
    for ri=1:13
        
        FU{i}(1,ri)=(LU{U_D(i)}(1,ri)/D(ri))/(length(U_Ind_2)/31116);
        FU{i}(2,ri)=(LU{U_D(i)}(2,ri)/D(ri))/(length(I_Ind_2)/31116);
        FU{i}(3,ri)=(LU{U_D(i)}(3,ri)/D(ri))/(length(R_Ind_2)/31116);
        FU{i}(4,ri)=(LU{U_D(i)}(4,ri)/D(ri))/(length(A_Ind_2)/31116);
    end
    FUMean=FUMean+FU{i};
end

FUMean=FUMean/length(U_D);
wu1=log10(FUMean);


% Industry
I_D=DI2(DI2(:,3)==2,1);
F_I=zeros(4,13);
F_I=repmat(F_I,[1,length(I_D)]);
FIMean=zeros(4,13);

for i=1:length(I_D)
    for ri=1:13
        F_I{i}(1,ri)=(LU{I_D(i)}(1,ri)/D(ri))/(length(U_Ind_2)/31116);
        F_I{i}(2,ri)=(LU{I_D(i)}(2,ri)/D(ri))/(length(I_Ind_2)/31116);
        F_I{i}(3,ri)=(LU{I_D(i)}(3,ri)/D(ri))/(length(R_Ind_2)/31116);
        F_I{i}(4,ri)=(LU{I_D(i)}(4,ri)/D(ri))/(length(A_Ind_2)/31116);
    end
    FIMean=FIMean+F_I{i};
end
FIMean=FIMean/length(I_D);
FI1=log10(FIMean);


% Rural
R_D=DI2(DI2(:,3)==3,1);
F_R={zeros(4,13)};
F_R=repmat(F_R,[1,length(R_D)]);
FRMean=zeros(4,13);

for i=1:length(R_D)
    for ri=1:13
        F_R{i}(1,ri)=(LU{R_D(i)}(1,ri)/D(ri))/(length(U_Ind_2)/31116);
        F_R{i}(2,ri)=(LU{R_D(i)}(2,ri)/D(ri))/(length(I_Ind_2)/31116);
        F_R{i}(3,ri)=(LU{R_D(i)}(3,ri)/D(ri))/(length(R_Ind_2)/31116);
        F_R{i}(4,ri)=(LU{R_D(i)}(4,ri)/D(ri))/(length(A_Ind_2)/31116);
    end
    FRMean=FRMean+ F_R{i};
end
FRMean=FRMean/length(R_D);
WR1=log10(FRMean);

% Agriculture
A_D=DI2(DI2(:,3)==4,1);
F_A={zeros(4,13)};
F_A=repmat(F_A,[1,length(A_D)]);
FAMean=zeros(4,13);

for i=1:length(A_D)
    for ri=1:13
        F_A{i}(1,ri)=(LU{A_D(i)}(1,ri)/D(ri))/(length(U_Ind_2)/31116);
        F_A{i}(2,ri)=(LU{A_D(i)}(2,ri)/D(ri))/(length(I_Ind_2)/31116);
        F_A{i}(3,ri)=(LU{A_D(i)}(3,ri)/D(ri))/(length(R_Ind_2)/31116);
        F_A{i}(4,ri)=(LU{A_D(i)}(4,ri)/D(ri))/(length(A_Ind_2)/31116);
    end
    FAMean=FAMean+F_A{i};
end
FAMean=FAMean/length(A_D);
WA1=log10(FAMean);


F={FUMean,FIMean,FRMean,FAMean};

UIRA={zeros(187,217)};
UIRA=repmat(UIRA,[1,4]);

N={zeros(4,11),zeros(4,10),zeros(4,11)};
NN=repmat(N,[187,217]);

for L=1:4
for i=1:187
for j=1:217
            
for s=0:2
if s==0
r=1;
t=0;
da=1;df=sqrt(2);
                    
elseif s==1
r=4;
t=1;
da=3;df=3*sqrt(2);
                    
 elseif s==2
r=13;
t=4;
da=9;df=9*sqrt(2);
 end
                
for i_ri=i-r:i+r
if i_ri<=0 || i_ri>187
 continue
end
                    
for j_ri=j-r:j+r
if j_ri<=0 || j_ri>217
 continue
end
 
 if i_ri<i-t && j_ri<j-t
if imageB(i_ri,j_ri)==1
 NN{i,j}{s+1}(1,6)=NN{i,j}{s+1}(1,6)+1;
elseif imageB(i_ri,j_ri)==2
NN{i,j}{s+1}(2,6)=NN{i,j}{s+1}(2,6)+1;
 elseif imageB(i_ri,j_ri)==3
 NN{i,j}{s+1}(3,6)=NN{i,j}{s+1}(3,6)+1;
elseif imageB(i_ri,j_ri)==4
NN{i,j}{s+1}(4,6)=NN{i,j}{s+1}(4,6)+1;
 end
elseif i_ri<i-t && j_ri>j+t
    
if imageB(i_ri,j_ri)==1
 NN{i,j}{s+1}(1,7)=NN{i,j}{s+1}(1,7)+1;
elseif imageB(i_ri,j_ri)==2
NN{i,j}{s+1}(2,7)=NN{i,j}{s+1}(2,7)+1;
elseif imageB(i_ri,j_ri)==3
 NN{i,j}{s+1}(3,7)=NN{i,j}{s+1}(3,7)+1;
 elseif imageB(i_ri,j_ri)==4
NN{i,j}{s+1}(4,7)=NN{i,j}{s+1}(4,7)+1;
end
elseif i_ri>i+t && j_ri<j-t
    
if imageB(i_ri,j_ri)==1
NN{i,j}{s+1}(1,8)=NN{i,j}{s+1}(1,8)+1;
elseif imageB(i_ri,j_ri)==2
 NN{i,j}{s+1}(2,8)=NN{i,j}{s+1}(2,8)+1;
 elseif imageB(i_ri,j_ri)==3
NN{i,j}{s+1}(3,8)=NN{i,j}{s+1}(3,8)+1;
elseif imageB(i_ri,j_ri)==4
NN{i,j}{s+1}(4,8)=NN{i,j}{s+1}(4,8)+1;
end
elseif i_ri>i+t && j_ri>j+t
    
 if imageB(i_ri,j_ri)==1
 NN{i,j}{s+1}(1,9)=NN{i,j}{s+1}(1,9)+1;
 elseif imageB(i_ri,j_ri)==2
NN{i,j}{s+1}(2,9)=NN{i,j}{s+1}(2,9)+1;
elseif imageB(i_ri,j_ri)==3
NN{i,j}{s+1}(3,9)=NN{i,j}{s+1}(3,9)+1;
elseif imageB(i_ri,j_ri)==4
NN{i,j}{s+1}(4,9)=NN{i,j}{s+1}(4,9)+1;
 end
 elseif i_ri<i-t && j_ri>=j-t && j_ri<=j+t
     
 if imageB(i_ri,j_ri)==1
NN{i,j}{s+1}(1,1)=NN{i,j}{s+1}(1,1)+1;
 elseif imageB(i_ri,j_ri)==2
NN{i,j}{s+1}(2,1)=NN{i,j}{s+1}(2,1)+1;
elseif imageB(i_ri,j_ri)==3
 NN{i,j}{s+1}(3,1)=NN{i,j}{s+1}(3,1)+1;
 elseif imageB(i_ri,j_ri)==4
 NN{i,j}{s+1}(4,1)=NN{i,j}{s+1}(4,1)+1;
end
elseif i_ri>i+t && j_ri>=j-t && j_ri<=j+t
    
if imageB(i_ri,j_ri)==1
NN{i,j}{s+1}(1,2)=NN{i,j}{s+1}(1,2)+1;
 elseif imageB(i_ri,j_ri)==2
NN{i,j}{s+1}(2,2)=NN{i,j}{s+1}(2,2)+1;
 elseif imageB(i_ri,j_ri)==3
NN{i,j}{s+1}(3,2)=NN{i,j}{s+1}(3,2)+1;
elseif imageB(i_ri,j_ri)==4
 NN{i,j}{s+1}(4,2)=NN{i,j}{s+1}(4,2)+1;
end
elseif i_ri>=i-t && i_ri<=i+t && j_ri>j+t
    
if imageB(i_ri,j_ri)==1
NN{i,j}{s+1}(1,3)=NN{i,j}{s+1}(1,3)+1;
elseif imageB(i_ri,j_ri)==2
NN{i,j}{s+1}(2,3)=NN{i,j}{s+1}(2,3)+1;
elseif imageB(i_ri,j_ri)==3
NN{i,j}{s+1}(3,3)=NN{i,j}{s+1}(3,3)+1;
 elseif imageB(i_ri,j_ri)==4
NN{i,j}{s+1}(4,3)=NN{i,j}{s+1}(4,3)+1;
 end
 elseif i_ri>=i-t && i_ri<=i+t && j_ri<j-t
     
 if imageB(i_ri,j_ri)==1
NN{i,j}{s+1}(1,4)=NN{i,j}{s+1}(1,4)+1;
elseif imageB(i_ri,j_ri)==2
NN{i,j}{s+1}(2,4)=NN{i,j}{s+1}(2,4)+1;
elseif imageB(i_ri,j_ri)==3
NN{i,j}{s+1}(3,4)=NN{i,j}{s+1}(3,4)+1;
elseif imageB(i_ri,j_ri)==4
NN{i,j}{s+1}(4,4)=NN{i,j}{s+1}(4,4)+1;
end
 end
 end
end
                NN{i,j}{s+1}(1,5)=(sum(NN{i,j}{s+1}(1,1:4)))*da*F{L}(1,round(da));
                NN{i,j}{s+1}(2,5)=(sum(NN{i,j}{s+1}(2,1:4)))*da*F{L}(2,round(da));
                NN{i,j}{s+1}(3,5)=(sum(NN{i,j}{s+1}(3,1:4)))*da*F{L}(3,round(da));
                NN{i,j}{s+1}(4,5)=(sum(NN{i,j}{s+1}(4,1:4)))*da*F{L}(4,round(da));
                
                NN{i,j}{s+1}(1,10)=(sum(NN{i,j}{s+1}(1,6:9)))*df*F{L}(1,round(df));
                NN{i,j}{s+1}(2,10)=(sum(NN{i,j}{s+1}(2,6:9)))*df*F{L}(2,round(df));
                NN{i,j}{s+1}(3,10)=(sum(NN{i,j}{s+1}(3,6:9)))*df*F{L}(3,round(df));
                NN{i,j}{s+1}(4,10)=(sum(NN{i,j}{s+1}(4,6:9)))*df*F{L}(4,round(df));
                
                NN{i,j}{s+1}(:,11)=NN{i,j}{s+1}(:,5)+NN{i,j}{s+1}(:,10);
            end
            TT=NN{i,j}{1}(:,11)+NN{i,j}{2}(:,11)+NN{i,j}{3}(:,11);
            UIRA{L}(i,j)=sum(TT);
        end
    end
end

ab=zeros(2,4);
N_UIRA=zeros(187,217);
N_UIRA=repmat(N_UIRA,[1,4]);
for L=1:4
    ab(1,L)=(max(max(UIRA{L}))-min(min(UIRA{L})))/0.8;
    ab(2,L)=(ab(1,L)/10)-min(min(UIRA{L}));
    N_UIRA{L}=(UIRA{L}+repmat(ab(2,L),[187 217]))/ab(1,L);
    for i=1:187
        for j=1:217
            N_UIRA{L}(i,j)=min(max(N_UIRA{L}(i,j),0),1);
        end
    end
end

figure 
plot(1:13,wu1(1,:));title(' urban to urban');xlabel('Ring');ylabel('W');
figure 
plot(1:13,wu1(2,:));title(' industry to urban');xlabel('Ring');ylabel('W');
figure 
plot(1:13,wu1(3,:));title(' Rural to urban');xlabel('Ring');ylabel('W');
figure 
plot(1:13,wu1(4,:));title(' Agriculture to urban');xlabel('Ring');ylabel('W');


figure 
plot(1:13,FI1(1,:));title(' urban to industry');xlabel('ring');ylabel('W');
figure 
plot(1:13,FI1(2,:));title('industry to industry');xlabel('Ring');ylabel('W');
figure 
plot(1:13,FI1(3,:));title(' Rural to industry');xlabel('Ring');ylabel('W');
figure 
plot(1:13,FI1(4,:));title(' Agriculture to industry');xlabel('Ring');ylabel('W');

figure 
plot(1:13,WR1(1,:));title(' urban to Rural');xlabel('Ring');ylabel('W');
figure 
plot(1:13,WR1(2,:));title(' industry to Rural');xlabel('Ring');ylabel('W');
figure 
plot(1:13,WR1(3,:));title(' Rural to Rural');xlabel('Ring');ylabel('W');
figure 
plot(1:13,WR1(4,:));title(' Agriculture to Rural');xlabel('Ring');ylabel('W');

figure 
plot(WA1(1,:));title(' urban to Agriculture');xlabel('Ring');ylabel('W');
figure 
plot(1:13,WA1(2,:));title(' industry to Agriculture');xlabel('Ring');ylabel('W');
figure 
plot(1:13,WA1(3,:));title(' Rural to Agriculture');xlabel('Ring');ylabel('W');
figure 
plot(1:13,WA1(4,:));title(' Agriculture to Agriculture');xlabel('Ring');ylabel('W');

figure
imagesc (N_UIRA{1});title('normal Urban');
figure
imagesc (N_UIRA{2});title('Nnormal Industry');
figure
imagesc (N_UIRA{3});title('normal Rural');
figure
imagesc (N_UIRA{4});title('normal Agriculture');
