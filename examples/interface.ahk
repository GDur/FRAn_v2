#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#SingleInstance Force
#Include ../FRAn/FRAn.ahk

; When the Send command or Hotstrings are used in their default (non-raw) mode, characters such as {}^!+# have special meaning. Therefore, to use them literally in these cases, enclose them in braces. For example: Send {^}{!}{{}.
; #EscapeChar \

FRAn.generateProfile(A_ScriptFullPath)
FRAn.speak("Say: 'OK FRAn', and I will help you!")
;FRAn.send("aaa`nlol")

;A window's title can contain WinTitle anywhere inside it to be a match. 
SetTitleMatchMode, 2 

; 'OK Fran'::
^F13::
	FRAn.startListening()
	FRAn.speak("Yes!")
return

; 'stop'::
^F14::
	FRAn.stopListening()
	FRAn.speak("ok")
return

; 'volume up'::
F24::
	if(!FRAn.isListening())
		return
	SoundSet +10  ; Increase master volume by 10%
	FRAn.speak("ok")
return

; 'volume down'::
^F23::
	if(!FRAn.isListening())
		return
	SoundSet -10  ; Increase master volume by 10%
	FRAn.speak("ok")
return

; 'set volume to maximum'::
F22::
	if(!FRAn.isListening())
		return
	SoundSet, 80
	FRAn.speak("ok")
return

; 'minimum volume'::
F21::
	if(!FRAn.isListening())
		return
	SoundSet, 30
	FRAn.speak("ok")
return

; 'revert action'::
F20::
	if(!FRAn.isListening())
		return
	Send, ^z
	FRAn.speak("ok")
return

; 'play movie radio'::
F19::^Numpad9
; 'play classic radio'::
F18::^Numpad8

; 'play main radio'::
F17::^Numpad5
; 'play club radio'::
F16::^Numpad4

#If WinActive("*")
	~Alt::Send, ^s {F5}

#If WinActive(".ahk") 
	; 'write function'::
	^F3::
		snippet =
		( LTrim
			fname(){
			}
		)
		FRAn.send(snippet)
		Send, {Left 5}^+{Left}
		FRAn.speak("ok")
	return
	
;#If WinActive(".js") OR  WinActive(".ts") 
	; 'write function'::
	^F1::
		snippet =
		( LTrim
			() => {
			  
			}
		)
		FRAn.send(snippet)
		Send, {Left 2}
		FRAn.speak("ok")
	return
	
	; 'write anon'::
	^F2::
		snippet =
		( LTrim
			function fname(){
			}
		)
		FRAn.send(snippet)
		Send, {Left 5}^+{Left}
		FRAn.speak("ok")
	return


