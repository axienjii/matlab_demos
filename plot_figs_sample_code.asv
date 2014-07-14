function plot_figs_sample_code
%Written by Xing 13/07/14 to generate example figure, plot markers, draw
%fitted curve, and export to a file

truncateXLim=1;
plotDataPoints=1;

%specify styles of lines to plot:
trainingStageLineStyles=[{':'} {'--'} {'-'}];

%colours- red, green, blue:
lineCols=[{'r'} {[0/256 100/256 0/256]} {'b'}];%speficy shade of green

%create figure:
fig1=figure('Color',[1,1,1],'Units','Normalized','Position',[0.12, 0.08, 0.25, 0.8]);%'Position': left, bottom, width, height

sampleContrast=30;
xDataPoints=[5,10,15,20,22,25,28,32,35,40,45,50,60,90];
yDataPoints=[0,0.0217,0.0632,0.0526,0.119,0.298,0.386,0.569,0.654,0.899,0.978,1,0.978,0.988];

%plot draw data points in the form of circles:
if plotDataPoints==1;
    plot(xDataPoints,yDataPoints,'Marker','o','Color',[0.5 0.5 0.5],'LineStyle','none','MarkerSize',5);
    hold on%holds the current plot and all axis properties so that subsequent graphing commands add to the existing graph
end

%perform curve fitting:
X0=[2 30 0.2 0.1];%initialise parameters
X=fminsearch(@fit_weibull,X0,[],xDataPoints,yDataPoints,[],'least_square',[1 0 1 0],[20 0 max(yDataPoints) 0],[1 0 0 0],[0 0 0 0]);
X=[4.36,33.5,0.99,0.0069];

%generate values for plotting fitted curve
xvals=0:1:xDataPoints(end)+10;
yvals=1-X(4)-X(3).*exp(-(xvals./X(2)).^X(1));

%draw fitted curve:
plot(xvals,yvals,'Color','r','LineStyle','-');

sampleContrasts=[20 30 40];
testContrasts=[5,10,12,15,18,22,25,28,35,45,60,90;5,10,15,22,25,28,32,35,38,45,60,90;5,10,15,25,32,35,38,42,45,50,60,90];
for sampleContrastInd=1:length(sampleContrasts)
    testContrast=testContrasts(sampleContrastInd,:);
    rovingPerf=[0,0.143,0,0.0769,0.077,0.150,0.255,0.364,0.667,1,0.923,1;0.0588,0.0588,0,0.0926,0.0588,0.313,0.516,0.535,0.870,0.925,0.979,1;0,0.0571,0.0294,0.0833,0.105,0.241,0.320,0.370,0.653,0.972,1,0.971];
    for trainingStage=1:3
        subplot(3,1,sampleContrastInd);
        
        %plot raw data as circles:
        if plotDataPoints==1;
            %specify the marker type, marker colour, marker size, and line
            %style:
            plot(testContrasts(sampleContrastInd,:),rovingPerf(trainingStage,:),'Marker','o','Color',lineCols{sampleContrastInd},'LineStyle','none','MarkerSize',5);
        end
        hold on
        
        %plot a fitted function:
        X=fminsearch(@fit_weibull,X0,[],testContrasts(sampleContrastInd,:),rovingPerf(trainingStage,:),[],'least_square',[1 0 1 0],[20 0 max(rovingPerf(trainingStage,:)) 0],[1 0 0 0],[0 0 0 0]);
        xvals=0:1:testContrast(end)+10;
        yvals=1-X(4)-X(3).*exp(-(xvals./X(2)).^X(1));
        plot(xvals,yvals,'Color',lineCols{sampleContrastInd},'LineStyle',trainingStageLineStyles{trainingStage});
        
        %plot a straight line:
        PSE=X(2).*(-log((0.5-X(4))/X(3))).^(1/X(1));
        plot([PSE PSE],[0 1],'Color',lineCols{sampleContrastInd},'LineStyle',trainingStageLineStyles{trainingStage});
        
        %specify axis limits:
        if truncateXLim==1
            xlim([0 65]);
        end
        
        %remove axes to the right & on top:
        set(gca,'box','off');
    end
end
subplot(3,1,1);
title('Figure title');
xlabel('Contrast');
ylabel('Performance');
%To save, use File > Export Setup.
%Check requirements with journal or other publication outlets: image
%formats, sizes, colour mode.
%Specify desired settings, save template for repeated use.


%
%creating figures with transparency in Matlab:
fig2=figure('Color',[1,1,1],'Units','Normalized','Position',[0.12, 0.08, 0.3, 0.4]);%'Position': left, bottom, width, height
%create some data to plot:
mean1=30;
mean2=50;
sigma=10;
y1=normrnd(mean1,sigma,500,1);%500 normally distributed values with a mean of mean1 and an SD of sigma
y2=normrnd(mean2,sigma,500,1);%500 normally distributed values with a mean of mean2 and an SD of sigma
%set bin centres:
bins=0:1:100;
%generate histogram for first data set, y1:
hist(y1,bins);
%get the handle to the patch object that creates the histogram bar plot:
h = findobj(gca,'Type','patch');
%remove edge colour (automaticaly set to black):
set(h,'EdgeColor','none')
%set transparency (to 0.5):
set(h,'FaceColor','r','facealpha',0.5)
hold on
%do the same for y2:
hist(y2,bins);
h = findobj(gca,'Type','patch');
set(h,'facealpha',0.5,'EdgeColor','none')
%set x-axis limits
xlim([0 80]);
%remove axes to the right & on top:
set(gca,'box','off');
%export figure as an svg file
plot2svg

%
%creating figures and adjusting transparency in Adobe Illustrator:
fig2=figure('Color',[1,1,1],'Units','Normalized','Position',[0.12, 0.08, 0.3, 0.4]);%'Position': left, bottom, width, height
%create some data to plot:
mean1=30;
mean2=50;
sigma=10;
y1=normrnd(mean1,sigma,500,1);%500 normally distributed values with a mean of mean1 and an SD of sigma
y2=normrnd(mean2,sigma,500,1);%500 normally distributed values with a mean of mean2 and an SD of sigma
%set bin centres:
bins=0:1:100;
%generate histogram for first data set, y1:
hist(y1,bins);
h = findobj(gca,'Type','patch');
set(h,'FaceColor',[0 .5 .5],'EdgeColor','none')
hold on
%do the same for y2:
hist(y2,bins);
h = findobj(gca,'Type','patch');
set(h,'EdgeColor','none')
%set x-axis limits
xlim([0 80]);
%remove axes to the right & on top:
set(gca,'box','off');
xlabel('x data');
ylabel('y data');

close all hidden
