

clear
close all
clc
tic


% INPUTS --------------------------------------------------------
num = 2501;                    % No. observation points [2501]

step=2;                       % Step of wavelength

wL = 400e-9;                  % Wavelength  [700e-9]
% SETUP ---------------------------------------------------------

figure(1)

% CALCULATIONS --------------------------------------------------
[xScr,yScr,zScr,IRRsr,graphColorr]=diffcolbylam(700e-9);

[xSca,ySca,zSca,IRRsa,graphColora]=diffcolbylam(630e-9); %#ok<ASGLU>

gca=zeros(num,3);

start=380;endn=700;ns=((endn-start)/step);

for w=start:step:endn
    [xSci,ySci,zSci,IRRsi,graphColori]=diffcolbylam(w*1e-9);
    xSca=xSca+xSci./ns;
    ySca=ySca+ySci./ns;
    zSca=zSca+zSci./ns;
    IRRsa=IRRsa+IRRsi./ns;
    gca=gca+graphColori.*IRRsi/ns;
end
graphColorm=gca./max(gca);
IRRsa=(IRRsa./max(IRRsa));

newCm=IRRsa.*graphColorm;
%newCm=IRRsa.*ones(num,3);


  subplot(1,1,1)%绘制颜色图
    hold on
    for j=1:num
        plot(j,0.5,'--rs','LineWidth',2,'MarkerEdgeColor','none','MarkerFaceColor',newCm(j,:),'MarkerSize',50,'LineStyle','none')
    end
%     for j=1:64
%         plot(j,0.25,'--rs','LineWidth',2,'MarkerEdgeColor','none','MarkerFaceColor',mycolor_g(j,:),'MarkerSize',6,'LineStyle','none')
%     end
    hold off
    title('白光')
    ylim([0 1])
    xlim([0 num])
    %set(gca,'xtick',[]);