#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


::text1::
(
It was nice speaking with you today. I have attached the confirmation letter for your upcoming seminar. 
We look forward to seeing you on the 20th of July, 2014.

Directions from the airport: http://www.ncl.ac.uk/about/visit/travel/air.htm
Maps for the campus and the city are available here: http://www.ncl.ac.uk/about/visit/maps.htm



)


::text2::
(
Yours sincerely,

Crystal Smith
Professor, Department of Neuroscience 
Newcastle University

Institute of Neuroscience
Henry Wellcome Building
Framlington Place
NE2 4HH
)

#a::
	Loop, 8
	{
	Send, +{Up}
	}
	Send, ^+s
	Send, no spacing
	Send, {Enter}
return

#v::  
	Loop, 2
	{
	Send, {Up}
	Sleep, 100
	}
	Send, {Left}
return


#g::
	;winname:="Document1 - Microsoft Word"
	MsgBox, 4, , Would you like to write a new letter?
	IfMsgBox, No
    		return
	InputBox, UserInput, Recipient Name, Please enter the name of the recipient, , 250, 150
	if ErrorLevel
    	MsgBox, CANCEL was pressed.
		else
    	MsgBox, You entered "%UserInput%"

	Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Word 2010"
	;WinActivate, %winname%
	;WinWaitActive, %winname%
	Sleep, 1000
	FormatTime, Date1,, MM/dd/yyyy
	Send, %Date1%
	Send, {Enter}
	Send, Dear %UserInput%,
	Loop, 2
	{
	Send, {Enter}
	}
return


#s::
	foldername:="H:\GitHub\xing_PL_code\matlab_demos\ahk"
	Send, ^s
	Sleep, 1000
	Send %foldername%\%UserInput%
	Sleep, 1000
	Sleep, 50
	FormatTime, Date2,, MMddyyyy
	Send _%Date2%
	Sleep, 100
	Send, {Enter}
return
