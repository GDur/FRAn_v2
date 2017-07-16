#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force


; When the Send command or Hotstrings are used in their default (non-raw) mode, characters such as {}^!+# have special meaning. Therefore, to use them literally in these cases, enclose them in braces. For example: Send {^}{!}{{}.
; #EscapeChar \ 

F2::
	snippets_Function =
	( LTrim
		function fname(){{}
		{}}
	)
	Send, %snippets_Function%{Left}{Left}{Left}{Left}{Left}^+{Left}
return

F3::
	snippets_anonFunction =
	( LTrim
		() => {{}
		  
		{}}
	)
	Send, %snippets_anonFunction%{Left}{Left}
return
