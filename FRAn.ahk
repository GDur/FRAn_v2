#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
; FRAn Freundlicher Replikatoren Android

; this script will react to 'OK Fran' and only after saying it will it perform commands
; it will countdown from 5 seconds to 0 and only in that time it will follow commands
; chaining commands: after performing a command the timer is reset to 5 seconds again

#Include SendViaClipboard.ahk
#Include TextToSpeech.ahk
#Include ProfileGenerator.ahk

class FRAn
{
	timeToListenLeft := 0
	initCountdown(){
		#Persistent
			SetTimer, countdown, 1000
		return

		countdown:
			timeToListenLeft := timeToListenLeft - 1
		return
	}

    send(msg) {
		sendViaClipboard(msg)
    }
	
    speak(msg) {
		speak(msg)
    }
	
	startListening(){
		global timeToListenLeft 
		timeToListenLeft := 5
	}

	isListening() {
		global timeToListenLeft 
		if(timeToListenLeft >= 0){
			this.startListening()
			return true
		}
		return false
	}
	generateProfile(scriptPath){
		generateProfile(scriptPath)
	}
}

; new FRAn()
FRAn.initCountdown()
FRAn.speak("asdadsa")
