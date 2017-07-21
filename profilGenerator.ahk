#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


fileName := "generatedProfile.xml"
FileDelete, %fileName%
FileAppend,
(
<?xml version="1.0" encoding="utf-8"?>
<gavpi>
), %fileName%

FileRead, OutputVar, interface.ahk

			
p := 1, m := ""
while p := RegExMatch(OutputVar, "m); '(.*)'::`r`n(.*)::", m, p + StrLen(m))
{
	
    ;;MsgBox, %m1% %m2%
	hotPhrase := m1
	hotKeyUsed := m2
	
	FileAppend,
	(
`n	<Action_Sequence name="%hotPhrase%" type="Action_Sequence" comment="" random="False">
		<Action type="KeyDown" value="%hotKeyUsed%" />
	</Action_Sequence>
	<Trigger name="%hotPhrase%" value="%hotPhrase%" type="Phrase" comment="">
		<Trigger_Event name="%hotPhrase%" type="Action_Sequence" value="" comment="" />
	</Trigger>
	), %fileName%
}

FileAppend,
(
`n</gavpi>
), %fileName%