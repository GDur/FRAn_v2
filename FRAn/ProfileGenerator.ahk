#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


generateProfile(ahkFile) {
	SplitPath, ahkFile, name, dir, ext, name_no_ext, drive

	fileName := name_no_ext ".xml"


	FileDelete, %fileName%
	FileAppend,
	(
	<?xml version="1.0" encoding="utf-8"?>
<gavpi>
	), %fileName%

	FileRead, OutputVar, %ahkFile%

				
	p := 1, m := ""
	while p := RegExMatch(OutputVar, "m); '(.*)'::`r`n(.*)::", m, p + StrLen(m))
	{
		
		;;MsgBox, %m1% %m2%
		hotPhrase := m1
		hotKeyUsed := m2
		
		;ColorArray := StrSplit(hotKeyUsed, "")
		hotkeyXML := ""
	/*	Loop % ColorArray.MaxIndex()
		{
			this_color := ColorArray[a_index]
			MsgBox, Color number %a_index% is %this_color%.
			
		}
	*/

	FileAppend,
		(
	`n	<Action_Sequence name="%hotPhrase%" type="Action_Sequence" comment="" random="False">
		), %fileName%
		
		
	IfInString, hotKeyUsed, ^
	{
	FileAppend,
		(
	`n		<Action type="KeyDown" value="ControlKey" />
		), %fileName%
	}
	StringReplace, tmphotKeyUsed, hotKeyUsed, ^, , All

	FileAppend,
		(
	`n		<Action type="KeyPress" value="%tmphotKeyUsed%" />
		), %fileName%
		
	IfInString, hotKeyUsed, ^
	{
	FileAppend,
		(
	`n		<Action type="KeyUp" value="ControlKey" />
		), %fileName%
	}

	FileAppend,
		(
	`n	</Action_Sequence>
	<Trigger name="%hotPhrase%" value="%hotPhrase%" type="Phrase" comment="">
		<Trigger_Event name="%hotPhrase%" type="Action_Sequence" value="" comment="" />
	</Trigger>`n
		), %fileName%
	}

	FileAppend,
	(
	`n</gavpi>
	), %fileName%

}