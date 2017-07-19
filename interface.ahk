#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force


; When the Send command or Hotstrings are used in their default (non-raw) mode, characters such as {}^!+# have special meaning. Therefore, to use them literally in these cases, enclose them in braces. For example: Send {^}{!}{{}.
; #EscapeChar \

sendViaClipboard(stringToPaste){
	ClipSaved := ClipboardAll   ; Save the entire clipboard to a variable of your choice.
	; ... here make temporary use of the clipboard, such as for pasting Unicode text via Transform Unicode ...
	Clipboard := stringToPaste
	ToolTip % ClipboardAll
	Sleep, 200
	Send, ^v
	Clipboard := ClipSaved   ; Restore the original clipboard. Note the use of Clipboard (not ClipboardAll).
	ClipSaved =   ; Free the memory in case the clipboard was very large.
}

;A window's title can contain WinTitle anywhere inside it to be a match. 
SetTitleMatchMode, 2 



F24::
	SoundSet +10  ; Increase master volume by 10%
return
F23::
	SoundSet -10  ; Increase master volume by 10%
return
F22::
	SoundSet, 80
return
F21::
	SoundSet, 30
return


#If WinActive("*")
	~Alt::Send, ^s {F5}

#If WinActive(".ahk") 
	<^>!F1::
		snippet =
		( LTrim
			fname(){
			}
		)
		sendViaClipboard(snippet)
		Send, {Left 5}^+{Left}
	return
	
;#If WinActive(".js") OR  WinActive(".ts") 
	^F1::
		snippet =
		( LTrim
			() => {
			  
			}
		)
		sendViaClipboard(snippet)
		Send, {Left 2}
	return
	
	^F2::
		snippet =
		( LTrim
			function fname(){
			}
		)
		sendViaClipboard(snippet)
		Send, {Left 5}^+{Left}
	return


