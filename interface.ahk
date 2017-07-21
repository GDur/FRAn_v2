#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
#Include FRAn.ahk
#Include SendViaClipboard.ahk
#Include TextToSpeech.ahk

; When the Send command or Hotstrings are used in their default (non-raw) mode, characters such as {}^!+# have special meaning. Therefore, to use them literally in these cases, enclose them in braces. For example: Send {^}{!}{{}.
; #EscapeChar \

speak("script ready")
;sendViaClipboard("aaa`nlol")

;A window's title can contain WinTitle anywhere inside it to be a match. 
SetTitleMatchMode, 2 

; 'OK Fran'::
F13::
	letFRAnListen()
return

; 'volume up'::
F24::
	if(!isFranListening())
		return
	SoundSet +10  ; Increase master volume by 10%
return

; 'volume down'::
F23::
	if(!isFranListening())
		return
	SoundSet -10  ; Increase master volume by 10%
return
F22::
	if(!isFranListening())
		return
	SoundSet, 80
return
F21::
	if(!isFranListening())
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


