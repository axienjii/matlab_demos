#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, 4, , Would you like to run this script?
IfMsgBox, No
    return

session=107

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
Send, 50
Sleep, 500
Send, {Tab}10
Sleep, 500
Send, {Tab}450
Sleep, 500
Send, {Tab}270
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