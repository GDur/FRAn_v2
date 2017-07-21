#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; this script will react to 'OK Fran' and only after saying it will it perform commands
; it will countdown from 5 seconds to 0 and only in that time it will follow commands
; chaining commands: after performing a command the timer is reset to 5 seconds again


#Persistent
	SetTimer, countdown, 1000
return

timeToListenLeft := 0

countdown:
	timeToListenLeft := timeToListenLeft - 1
return

letFRAnListen(){
	global timeToListenLeft 
	timeToListenLeft
}
isFranListening() {
	global timeToListenLeft 
	if(timeToListenLeft >= 0){
		letFRAnListen()
		return true
	}
	return false
}