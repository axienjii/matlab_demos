#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#g::
	MouseClick, left,  153,  15
	Sleep, 1000
	MouseClick, right,  494,  461
	Sleep, 1000
	MouseClick, left,  810,  398
	Sleep, 1000
	Send, demo{SHIFTDOWN}-{SHIFTUP}folder
	MouseClick, left,  682,  447
	Sleep, 1000
return