function save_mat_file
%Written by Xing 29/05/14
%Example code for saving mat files

var1=[];
var2=[];
var3=[];

overwriteMatFile=1;

%Set directory:
rootFolder='C';
if useISI==0
    subFolder='new_vs_old_individualchannels';
elseif useISI==1
    subFolder='new_vs_old_useISI_individualchannels';
end
if excludeSuppressed
    subFolder=[subFolder,'_excludeSuppressed'];
end
if normalize
    subFolder=[subFolder,'_normalised'];
end
if criterionType==1
    subFolder=[subFolder,'_equalOrLower'];
elseif criterionType==2
    subFolder=[subFolder,'_equalOrHigher'];
end
if paperSessions
    subFolder=[subFolder,'_paperSessions'];
end
folderPathName=fullfile(rootFolder,'PL',analysisType,animal,subFolder);%insert a '\'

%Check that dir exists, create it if not:
if ~exist(folderpathname,'dir')
    mkdir(folderpathname);
end

%Set file path:
saveMatText=[folderPathName,'\descriptiveMatFileName.mat'];

%Save file:
if ~exist(saveMatText,'file')||overwriteMatFile==1%check whether it already exists, or can be overwritten
    save(saveMatText,'var1','var2','var3')
end
