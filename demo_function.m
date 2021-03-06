function demo_function(dataFile,sessionNumber)
%Written by Xing 10/06/14.
%Demo function to read data from txt files, plot figures, save figures, and
%write data to Excel spreadsheet.

rootDir='H:\GitHub\xing_PL_code\matlab_demos\ahk';%set this to desired directory
plotColors=colormap(hsv(10));
dataVals=[];
allAnimalNames=cell(1,1);

%Open data file (a text document):
fid1=fopen(dataFile,'r');%file ID
animalCount=0;

%Create a figure:
fig1=figure('Color',[1,1,1],'Units', 'Normalized', 'Position',[0.2, 0.3, 0.5, 0.5]);
set(fig1, 'PaperUnits', 'centimeters', 'PaperType', 'usletter', 'PaperOrientation', 'portrait', 'PaperPosition', [0.6 0.4 0.4 0.5]);

%Read data file:
while feof(fid1)==0
    animalCount=animalCount+1;
    animalName=fscanf(fid1,'%s',1);%read the animal name from the data file
    allAnimalNames{animalCount}=animalName;
    dataVals{animalCount}=fscanf(fid1,'%f',5);%read the data values (5 values)
    subplot(2,2,animalCount+1);
    plot(1:length(dataVals{animalCount}),dataVals{animalCount},'Color',plotColors(animalCount,:),'MarkerSize',4,'LineStyle','--','Marker','o','MarkerFaceColor',plotColors(animalCount,:));
    title(animalName);
    xlabel('conditions');
    ylabel('measured values');
    subplot(2,2,1);
    plot(1:length(dataVals{animalCount}),dataVals{animalCount},'Color',plotColors(animalCount,:),'MarkerSize',4,'LineStyle','--','Marker','o','MarkerFaceColor',plotColors(animalCount,:));
    title('all animals');
    xlabel('conditions');
    ylabel('measured values');
    hold on
end

%Copy nicely-formatted table from the 'template' spreadsheet and paste them into a new spreadsheet:
templateFormatting=xlsread([rootDir,'\demo_spreadsheet.xlsx'],'template','D1:I2');
xlswrite([rootDir,'\demo_spreadsheet.xlsx'],templateFormatting,num2str(sessionNumber));

%Write data to an Excel spreadsheet:
for animalCount=1:length(allAnimalNames)
    %Write each animal name to a cell in the Excel spreadsheet:
    xlswrite([rootDir,'\demo_spreadsheet.xlsx'],{allAnimalNames{animalCount}},num2str(sessionNumber),['D',num2str(2+animalCount)]);
    %Write the data to a row of 5 cells (spannnig columns E to I) in the Excel spreadsheet:
    xlswrite([rootDir,'\demo_spreadsheet.xlsx'],dataVals{animalCount},num2str(sessionNumber),['E',num2str(2+animalCount),':','I',num2str(2+animalCount)]);
end

%Save image:
imagename=['animals_',num2str(sessionNumber)];
pathname=fullfile(rootDir,'images',imagename);
printtext=sprintf('print -dpng %s.png',pathname);
set(gcf,'PaperPositionMode','auto')
eval(printtext);

