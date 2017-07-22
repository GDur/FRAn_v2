#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
#Include FRAn.ahk

; When the Send command or Hotstrings are used in their default (non-raw) mode, characters such as {}^!+# have special meaning. Therefore, to use them literally in these cases, enclose them in braces. For example: Send {^}{!}{{}.
; #EscapeChar \

FRAn.speak("script ready")
;FRAn.send("aaa`nlol")

;A window's title can contain WinTitle anywhere inside it to be a match. 
SetTitleMatchMode, 2 

; 'OK Fran'::
^F13::
	FRAn.startListening()
	FRAn.speak("Yes")
return

; 'volume up'::
F24::
	if(!FRAn.isListening())
		return
	SoundSet +10  ; Increase master volume by 10%
return

; 'volume down'::
^F23::
	if(!FRAn.isListening())
		return
	SoundSet -10  ; Increase master volume by 10%
return

; 'maximum volume'::
F22::
	if(!FRAn.isListening())
		return
	SoundSet, 80
return

; 'minimum volume'
F21::
	if(!FRAn.isListening())
		return
	SoundSet, 30
return


#If WinActive("*")
	~Alt::Send, ^s {F5}

#If WinActive(".ahk") 
	^F3::
		snippet =
		( LTrim
			fname(){
			}
		)
		FRAn.send(snippet)
		Send, {Left 5}^+{Left}
	return
	
;#If WinActive(".js") OR  WinActive(".ts") 
	^F1::
		snippet =
		( LTrim
			() => {
			  
			}
		)
		FRAn.send(snippet)
		Send, {Left 2}
	return
	
	^F2::
		snippet =
		( LTrim
			function fname(){
			}
		)
		FRAn.send(snippet)
		Send, {Left 5}^+{Left}
	return



FRAn.generateProfile(A_ScriptFullPath)