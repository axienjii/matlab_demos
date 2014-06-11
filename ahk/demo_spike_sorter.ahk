#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

session=124_demo
folder=I:\pl_spnorm_nse\jack\%session%
channel[1]=1
channel[2]=2
channel[3]=3
channel[4]=4
channel[5]=5
channel[6]=6
channel[7]=8
channel[8]=10
channel[9]=24
channel[10]=35
channel[11]=37
channel[12]=39
channel[13]=40
channel[14]=41
channel[15]=49
channel[16]=50
channel[17]=52
channel[18]=53
channel[19]=54
channel[20]=56

v:: 
	Send, ^s
	Sleep, 800    	
	Send, SpikeCh_%chNum%_.NSE
	Sleep, 300
	Send, {Enter}
	Sleep, 100
return

f:: 
	Send, {Enter}
return

#a::  
		Send, {WheelDown}
		Sleep, 100
		Send ^{Click 298, 622}
		Sleep, 100
		Send ^{Click 298, 87}
		Sleep, 100
return
	
#v::  

		Send, ^f
		Sleep, 100
		Loop, 14
		{
		Send, {Tab}
		Sleep, 100
		}
		Loop, 11
		{
		Send, {Up}
		Sleep, 100
		}
		Loop, 4
		{
		Send, {Tab}
		Sleep, 100
		}
		Loop, 8
		{
		Send, {Up}
		Sleep, 100
		}
		Sleep, 100
		Loop, 2
		{
		Send, {Tab}
		Sleep, 100
		}
		Loop, 1
		{
		Send, {Down}
		Sleep, 100
		}
		Sleep, 100		
		Send, {Enter}
		Sleep, 100
		
return


#c::
Loop, 4
{
Send, w
Sleep, 200
}
Loop, 4
{
Send, s
Sleep, 200
}
Loop, 4
{
Send, x
Sleep, 200
}
return


chOpen=0
#g::
MsgBox, 4, , Would you like to run the SpikeSorter on session %session%?
IfMsgBox, No
    return

Run "C:\Program Files (x86)\Neuralynx\SpikeSort 3D\SpikeSort3D.exe"
Sleep, 2000
numLoops=30

Loop, %numLoops%
{
	Send, ^o
	Sleep, 100
	chCount=0
	Sleep, 100
	chCount+=%chOpen%
	Sleep, 100
	chCount+=1
	Sleep, 100		
	Send, ^o
	Sleep, 1000
	chOpen+=1
	Sleep, 300
	chNum:=channel[%chOpen%]
	Sleep, 300
	Send, "%folder%\spk_%chNum%_spnorm.nse"
	Sleep, 300
	Send, {Enter}
	Sleep, 300	
	Send, {Tab}
	Sleep, 300
	Send, {Enter}
	Sleep, 300
	;Send, {Insert}
	Send, {Enter}
	Sleep, 100
	Send, 1
	Sleep, 1000
	IfEqual, chOpen, 1
	{
		Send, +{F2}
		Sleep, 100
		Send, +{F3}
		Sleep, 100
		Send, +{F4}
		Sleep, 100
		Send, +{F5}
		Sleep, 100
		Send, +{F6}
		Sleep, 100
		Click 1880, 86
		Sleep, 3000
		Send, 1
		Sleep, 100
	}

	Loop, 5
	{
		KeyWait, d, D
		MsgBox, 4, , Close current channel & move on to the next?
		IfMsgBox, Yes
		goto continue_outer
	}
	
	continue_outer:	
	ErrorLevel:=ErrorLevel	
}
return

