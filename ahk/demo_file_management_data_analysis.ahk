#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, 4, , Would you like to run this script?
IfMsgBox, No
    return

SetWorkingDir, H:\GitHub\xing_PL_code\matlab_demos\ahk

todayfolder=120614
newfolder=130614
session=107

filename1=data.1
filename2=data.2
filename3=data.3

CopyFilesInFolder(SourcePattern, DestinationFolder, DoOverwrite = false)
{
    ; First copy all the files (but not the folders):
    FileCopy, %SourcePattern%, %DestinationFolder%, %DoOverwrite%
    ErrorCount := ErrorLevel    
    return ErrorCount
}


IfExist, %newfolder%
{
MsgBox, %newfolder% already exists!
}

IfNotExist, %newfolder%
{
FileCreateDir, %newfolder%
MsgBox, created %newfolder%

ErrorCount := % CopyFilesInFolder(todayfolder, newfolder)
if ErrorCount <> 0
    MsgBox %ErrorCount% files/folders could not be copied.

SetWorkingDir, J:\CORTEX\c597\Jack\%newfolder%
FileDelete, %filename1%
FileDelete, %filename2%
FileDelete, %filename3%
}
;this closed bracket ends 'IfNotExist, %newfolder%'



backupfolder=H:\GitHub\xing_PL_code\matlab_demos\ahk\backups\%session%\
IfExist, %backupfolder%
{
MsgBox, %backupfolder% already exists!
}

IfNotExist, %backupfolder%
{
FileCreateDir, %backupfolder%
MsgBox, created %backupfolder%

SetWorkingDir, H:\GitHub\xing_PL_code\matlab_demos\ahk\%todayfolder%
FileCopy, task_settings, %backupfolder%
FileCopy, task_settings2, %backupfolder%
FileCopy, task_settings3, %backupfolder%
FileCopy, task_settings4, %backupfolder%
FileCopy, task_settings5, %backupfolder%
FileCopy, task_settings6, %backupfolder%
FileCopy, data.1, %backupfolder%
FileCopy, data.2, %backupfolder%
FileCopy, data.3, %backupfolder%
FileCopy, %backupfolder%\log_template.txt, %backupfolder%log_%todayfolder%.txt
}
; this closed bracket ends 'IfNotExist, %backupfolder%'


MsgBox, 4, , File management stage complete, continue with data analysis?
IfMsgBox, No
    return

MsgBox, 4, , Create new Excel spreadsheet?
IfMsgBox, Yes
{
Run "C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.EXE"
Sleep, 2000
Send, {Enter}
SetKeyDelay, 1000
Sleep, 1000
Send, ^o
Sleep, 2000
Send, H:\GitHub\xing_PL_code\matlab_demos\ahk\demo_spreadsheet.xlsx{Enter}
Sleep, 1000
Send, ^{PgDn}
Sleep, 100
Send, ^a
Sleep, 100
Send, ^a
Sleep, 100
Send, ^c
Sleep, 100
Send, +{f11}
Sleep, 100
Send, !h
Sleep, 100
Send, o
Sleep, 100
Send, r
Sleep, 100
Send, %session%{Enter}
Sleep, 100
Send, ^v
Sleep, 1000
;Send, !h
;Sleep, 100
;Send, o
;Sleep, 100
;Send, m
;Sleep, 100
;Send, {End}
;Sleep, 100
;Send, {Enter}
;Sleep, 100
Send, ^{PgDn}
Sleep, 100
Send, ^s
Sleep, 1000
Send, !{f4}
WinWaitClose, demo_spreadsheet.xlsx
}

WinTitle=Figure2
Run "C:\MATLAB\R2009b64\bin\matlab.exe"
Sleep, 20000

matlabwinname:="MATLAB  7.9.0 (R2009b)"
WinActivate, %matlabwinname%
WinWaitActive, %matlabwinname%
Sleep, 1000
Send, demo_function('H:\GitHub\xing_PL_code\matlab_demos\ahk\%todayfolder%\data.1',%session%)
Send, {Enter}
Sleep, 25000

IfExist, H:\GitHub\xing_PL_code\matlab_demos\ahk\images\animals_%session%.png
{
Sleep, 5
WinActivate, %matlabwinname%
WinWaitActive, %matlabwinname%
Send,^q
WinWaitClose, %matlabwinname%
}

MsgBox, 4, , Crop images?
IfMsgBox, Yes
{
IfExist, H:\GitHub\xing_PL_code\matlab_demos\ahk\images\animals_%session%.png
{
Run, "C:\Program Files (x86)\IrfanView\i_view32.exe"
WinWait, IrfanView
Sleep, 100
Send, o
Sleep, 1000
Send, H:\GitHub\xing_PL_code\matlab_demos\ahk\images\animals_%session%.png{Enter}
Sleep, 500
Send, +c
Sleep, 500
Send, {Tab}
Sleep, 500
Send, {Tab}
Sleep, 1000
Send, 120
Sleep, 500
Send, {Tab}10
Sleep, 500
Send, {Tab}600
Sleep, 500
Send, {Tab}450
Sleep, 500
Send, {Enter}
Sleep, 500
Send, ^y
Sleep, 500
Send, s
Sleep, 500
Send, H:\GitHub\xing_PL_code\matlab_demos\ahk\images\animals_%session%_crop.png{Enter}
Sleep, 1000
Send, {Esc}
}

}
;this closed bracket ends 'Crop images?'
MsgBox, Done!