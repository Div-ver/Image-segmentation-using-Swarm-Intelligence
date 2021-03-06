% Function to be optimized:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [J]=nutrientsfunc(theta,flag,iteration)

if flag==1  % Test to see if main program indicated nutrients
	J=0;
	return
end

a=0.5-(0.1*sin(theta(1,1))^2);
b=0.9+0.1*sin(theta(2,1));
t1=1+0.1*(sin(theta(3,1)));
t2=100+(1.5*sin(theta(4,1)))^2;
beta=4+0.5*(sin(theta(5,1)));

if iteration==1 
end

[del_sort2,col]= fun1();
u1=zeros(1,col);
u2=zeros(1,col);

for j=4:col-3
u1(j)=1/(1+abs((del_sort2(j)-t1)/t2)^2*beta); 
       if(u1(j)<=a)
          u2(j)=0;
      elseif((u1(j)>a)&&(u1(j)<b))
          u2(j)=abs((u1(j)-a)/(a-b));
      elseif(u1(j)>=b)
          u2(j)=1;
       end
  end

E=0;
E1=0;
J=0;
for k=0:col-1
    
%         E1=E1+(-1*(u1(k+1).*(log(u1(k+1)+.00000000001))+(1-u1(k+1)).*(log(1-u1(k+1)+.00000000001))))+(-1*(u2(k+1).*(log(u2(k+1)+.00000000001))+(1-u2(k+1)).*(log(1-u2(k+1)+.00000000001))));
               E1=E1+(-1*(u2(k+1).*(log(u2(k+1)+.00000000001))+(1-u2(k+1)).*(log(1-u2(k+1)+.00000000001))));
              
end

E=E1/(col*log(2));
J=(0.5-E)  % this is the objective function . replace it with your objective function

