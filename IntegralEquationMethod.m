clc;
close all;
clear all;

length = 1000;
radius = 0.05;
seg = 1000;
voltage = 1;
delta = length/seg;
Z = zeros(seg,seg);

for i=1:seg
   for j=1:seg
      if(i==j)
          Z(i,j) = 2*log(((delta/2)+sqrt((radius)^2+(delta/2)^2))/(radius));
      end
      if(i~=j)
         if(i==1)
            d_plus = ((j-1)*delta)+(delta/2); 
            d_minus = ((j-1)*delta)-(delta/2); 
            Z(i,j) = log(d_plus/d_minus);
         end
      end
   end
end

for i=1:(seg-1)
   if(i==1)
      temp = Z(1,:);
      temp = temp';
      Zx = Z;
      Zx(:,1) = temp;
   end
   temp(end) = [];
   Zx(i+1:end,i+1) = temp;
   temp = temp';
   Zx(i+1,i+1:end) = temp;
   temp = temp';
end

for count = 1:seg
   volt(count) = 4*pi*(8.854*10^(-12)); 
end

volt = volt';
Zf = inv(Zx);
current = Zf*volt;

for dog = 1:seg
poop(dog) = dog;
end

plot(poop*delta,current);

%%








