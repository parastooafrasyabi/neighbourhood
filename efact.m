clc;format long g;close all;
%farakhani image 2
imagA=imread ('lu_2.tif');
figure
c=histeq(imagA);
imshow(c);
a=zeros(203,233);
a(9:195,9:225)=imagA;

%farakhani image 1
imageB=imread ('lu_1.tif');
figure
d=histeq(imageB);
imshow(d);
b=zeros(203,233);
b(9:195,9:225)=imageB;

%taghirat a az b
Q=a-b;

%tadad pixel her karbari image 2
Urban=0;Indestry=0;Rural=0;Agricultural=0;Baier=0;Z=0;
for i=1:187
    for j=1:217
        
        if imagA(i,j)==1
            Urban=Urban+1;
        end
        
        if imagA(i,j)==2
            Indestry=Indestry+1;
        end
        
        if imagA(i,j)==3
            Rural=Rural+1;
        end
        
        if imagA(i,j)==4
            Agricultural=Agricultural+1;
        end
        
        if imagA(i,j)==6
            Baier=Baier+1;
        end
        
        if imagA(i,j)==0
            Z=Z+1;
        end
        
    end  
end
Urban;Indestry;Rural;Agricultural;Baier;Z;pt=(187*217)-Z;

%mohasebe tadad pixel her karbary image 1
Urban1=0;Industry1=0;Rural1=0;Agricultural1=0;Baier1=0;Z1=0;
for i=1:187
    for j=1:217
        
        if imageB(i,j)==1
            Urban1=Urban1+1;
        end
        
        if imageB(i,j)==2
            Industry1=Industry1+1;
        end
        
        if imageB(i,j)==3
            Rural1=Rural1+1;
        end
        
        if imageB(i,j)==4
            Agricultural1=Agricultural1+1;
        end
        
        if imageB(i,j)==6
            Baier1=Baier1+1;
        end
        
        if imageB(i,j)==0
            Z1=Z1+1;
        end
        
    end
end
Urban1;Industry1;Rural1;Agricultural1;Baier1;Z1;pixel_total1=(187*217)-Z1;

% mohasebe her ring
F_UU=zeros(1,8);Fsum_UU=zeros(1,8);F_IU=zeros(1,8);Fsum_IU=zeros(1,8);F_RU=zeros(1,8);Fsum_RU=zeros(1,8);F_AU=zeros(1,8);Fsum_AU=zeros(1,8);
F_UI=zeros(1,8);Fsum_UI=zeros(1,8);F_II=zeros(1,8);Fsum_II=zeros(1,8);F_RI=zeros(1,8);Fsum_RI=zeros(1,8);F_AI=zeros(1,8);Fsum_AI=zeros(1,8);
F_UR=zeros(1,8);Fsum_UR=zeros(1,8);F_IR=zeros(1,8);Fsum_IR=zeros(1,8);F_RR=zeros(1,8);Fsum_RR=zeros(1,8);F_AR=zeros(1,8);Fsum_AR=zeros(1,8);
F_UA=zeros(1,8);Fsum_UA=zeros(1,8);F_IA=zeros(1,8);Fsum_IA=zeros(1,8);F_RA=zeros(1,8);Fsum_RA=zeros(1,8);F_AA=zeros(1,8);Fsum_AA=zeros(1,8);

for i=9:178
    for j=9:209
        if Q(i,j)~=0
         D=[8,16,24,32,40,48,56,64];
         KUrban=zeros(1,8);KIndustry=zeros(1,8);KRural=zeros(1,8);KAgricultur=zeros(1,8);
         for d=1:8
              for m=i-d:i+d
                 for n=j-d:j+d 
                     
                     if a(m,n)==1
                        KUrban(1,d)=KUrban(1,d)+1;
                     end
                     
                     if a(m,n)==2
                        KIndustry(1,d)=KIndustry(1,d)+1;
                     end
                     
                     if a(m,n)==3
                        KRural(1,d)=KRural(1,d)+1;
                     end
                     
                     if a(m,n)==4
                        KAgricultur(1,d)=KAgricultur(1,d)+1;
                     end
                     
                 end
              end  
          
               for q=1:7
                   kUrban(1,q+1)=KUrban(1,q+1)-KUrban(1,q);
                   kIndustry(1,q+1)=KIndustry(1,q+1)-KIndustry(1,q);
                   kRural(1,q+1)=KRural(1,q+1)-KRural(1,q);
                   kAgricultur(1,q+1)=KAgricultur(1,q+1)-KAgricultur(1,q);
               end
                   kUrban(1,1)=KUrban(1,1);
                   kIndustry(1,1)=KIndustry(1,1);
                   kRural(1,1)=KRural(1,1);
                   kAgricultur(1,1)=KAgricultur(1,1);
                   
                  %mohasbe maghadir f
               if a(i,j)==1
                    F_UU(1,d)=(kUrban(1,d)/D(1,d))/(Urban/pt);
                    Fsum_UU(1,d)=Fsum_UU(1,d)+F_UU(1,d);
                    F_IU(1,d)=(kIndustry(1,d)/D(1,d))/(Indestry/pt);
                    Fsum_IU(1,d)=Fsum_IU(1,d)+F_IU(1,d);
                    F_RU(1,d)=(kRural(1,d)/D(1,d))/(Rural/pt);
                    Fsum_RU(1,d)=Fsum_UU(1,d)+F_RU(1,d);
                    F_AU(1,d)=(kAgricultur(1,d)/D(1,d))/(Agricultural/pt);
                    Fsum_AU(1,d)=Fsum_AU(1,d)+F_AU(1,d);
               end
               
               if a(i,j)==2
                    F_UI(1,d)=(kUrban(1,d)/D(1,d))/(Urban/pt);
                    Fsum_UI(1,d)=Fsum_UI(1,d)+F_UI(1,d);
                    F_II(1,d)=(kIndustry(1,d)/D(1,d))/(Indestry/pt);
                    Fsum_II(1,d)=Fsum_II(1,d)+F_II(1,d);
                    F_RI(1,d)=(kRural(1,d)/D(1,d))/(Rural/pt);
                    Fsum_RI(1,d)=Fsum_RI(1,d)+F_RI(1,d);
                    F_AI(1,d)=(kAgricultur(1,d)/D(1,d))/(Agricultural/pt);
                    Fsum_AI(1,d)=Fsum_AI(1,d)+F_AI(1,d);
               end
               
               if a(i,j)==3
                    F_UR(1,d)=(kUrban(1,d)/D(1,d))/(Urban/pt);
                    Fsum_UR(1,d)=Fsum_UR(1,d)+F_UR(1,d);
                    F_IR(1,d)=(kIndustry(1,d)/D(1,d))/(Indestry/pt);
                    Fsum_IR(1,d)=Fsum_IR(1,d)+F_IR(1,d);
                    F_RR(1,d)=(kRural(1,d)/D(1,d))/(Rural/pt);
                    Fsum_RR(1,d)=Fsum_RR(1,d)+F_RR(1,d);
                    F_AR(1,d)=(kAgricultur(1,d)/D(1,d))/(Agricultural/pt);
                    Fsum_AR(1,d)=Fsum_AR(1,d)+F_AR(1,d);
               end
               
               if a(i,j)==4
                    F_UA(1,d)=(kUrban(1,d)/D(1,d))/(Urban/pt);
                    Fsum_UA(1,d)=Fsum_UA(1,d)+F_UA(1,d);
                    F_IA(1,d)=(kIndustry(1,d)/D(1,d))/(Indestry/pt);
                    Fsum_IA(1,d)=Fsum_IA(1,d)+F_IA(1,d);
                    F_RA(1,d)=(kRural(1,d)/D(1,d))/(Rural/pt);
                    Fsum_RA(1,d)=Fsum_RA(1,d)+F_RA(1,d);
                    F_AA(1,d)=(kAgricultur(1,d)/D(1,d))/(Agricultural/pt);
                    Fsum_AA(1,d)=Fsum_AA(1,d)+F_AA(1,d);
               end
               
         end
        end
    end        
end
%myangin garaften az maghadir marhele ghabel
FUU=Fsum_UU/Urban;FIU=Fsum_IU/Urban;FRU=Fsum_RU/Urban;FAU=Fsum_AU/Urban;
FUI=Fsum_UI/Indestry;FII=Fsum_II/Indestry;FRI=Fsum_RI/Indestry;FAI=Fsum_AI/Indestry;
FUR=Fsum_UR/Rural;FIR=Fsum_IR/Rural;FRR=Fsum_RR/Rural;FAR=Fsum_AR/Rural;
FUA=Fsum_UA/Agricultural;FIA=Fsum_IA/Agricultural;FRA=Fsum_RA/Agricultural;FAA=Fsum_AA/Agricultural;

%plot W
w_uu=log (FUU);w_iu=log (FIU);w_ru=log (FRU);w_au=log (FAU);
w_ui=log (FUI);w_ii=log (FII);w_ri=log (FRI);w_ai=log (FAI);
w_ur=log (FUR);w_ir=log (FIR);w_rr=log (FRR);w_ar=log (FAR);
w_ua=log (FUA);w_ia=log (FIA);w_ra=log (FRA);w_aa=log (FAA);

figure 
plot(1:8,w_uu);title(' urban to urban');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_iu);title(' industry to urban');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ru);title(' Rural to urban');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_au);title(' Agriculture to urban');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ui);title(' urban to industry');xlabel('ring');ylabel('W');
figure 
plot(1:8,w_ii);title('industry to industry');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ri);title(' Rural to industry');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ai);title(' Agriculture to industry');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ur);title(' urban to Rural');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ar);title(' industry to Rural');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_rr);title(' Rural to Rural');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ar);title(' Agriculture to Rural');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ua);title(' urban to Agriculture');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ia);title(' industry to Agriculture');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_ra);title(' Rural to Agriculture');xlabel('Ring');ylabel('W');
figure 
plot(1:8,w_aa);title(' Agriculture to Agriculture');xlabel('Ring');ylabel('W');

% Normalization
d=0;
w_ri(1,1)=0;
w_ur(1,1)=0;
w_ur(1,2)=0;
w_ir(1,1)=0;
w_rr(1,8)=0;

FU=[w_uu;w_iu;w_ru;w_au];
FI=[w_ui;w_ii;w_ri;w_ai];
FR=[w_ur;w_ir;w_rr;w_ar];
FA=[w_ua;w_ia;w_ra;w_aa];

for i=9:178
    for j=9:209
        N_U(i,j)=0;
        N_I(i,j)=0;
        N_R(i,j)=0;
        N_A(i,j)=0;
        for m=i-8:i+8
            for n=j-8:j+8
                d=abs(i-m);
                if d<abs(j-n)
                    d=abs(j-n);
                end
                if a(i,j)~=0 && a(i,j)~=6 && d~=0 && a(m,n)~=0 && a(m,n)~=6
                N_U(i,j)=N_U(i,j)+FU(a(m,n),d);
                N_I(i,j)=N_I(i,j)+FI(a(m,n),d);
                N_R(i,j) = N_R(i,j)+FR(a(m,n),d);
                N_A(i,j)=N_A(i,j)+FA(a(m,n),d);

                end
            end
        end
    end
end

xu=(max(max(N_U))-min(min(N_U)))/0.8;yu=(xu/10)-min(min(N_U));N_U_normal=min(max(0,(N_U+yu)/xu),1);
xi=(max(max(N_I))-min(min(N_I)))/0.8;yi=(xi/10)-min(min(N_I));N_I_normal=min(max(0,(N_I+yi)/xi),1);
xr=(max(max(N_R))-min(min(N_R)))/0.8;yr=(xr/10)-min(min(N_R));N_R_normal=min(max(0,(N_R+yr)/xr),1);
xa=(max(max(N_A))-min(min(N_A)))/0.8;ya=(xa/10)-min(min(N_A));N_A_normal=min(max(0,(N_A+ya)/xa),1);

figure
imagesc (N_U_normal);title('normal Urban');
figure
imagesc (N_I_normal);title('Nnormal Industry');
figure
imagesc (N_R_normal);title('normal Rural');
figure
imagesc (N_A_normal);title('normal Agriculture');
