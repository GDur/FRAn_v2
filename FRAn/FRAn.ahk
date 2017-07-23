#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
; FRAn Freundlicher Replikatoren Android

; this script will react to 'OK Fran' and only after saying it will it perform commands
; it will countdown from 5 seconds to 0 and only in that time it will follow commands
; chaining commands: after performing a command the timer is reset to 5 seconds again

#Include %A_ScriptDir%/FRAn/TextToSpeech.ahk
#Include %A_ScriptDir%/FRAn/ProfileGenerator.ahk
#Include %A_ScriptDir%/FRAn/SendViaClipboard.ahk



class FRAn
{
	
	timeWentBy(){
		
		this.timeToListenLeft -= 1
		}

    send(msg) {
		sendViaClipboard(msg)
    }
	
    speak(msg) {
		speakWait(msg)
    }
	
	startListening() {
		this.timeToListenLeft := 5
	}
	
	stopListening() {
		this.timeToListenLeft := -1
	}
	
	isListening() {
		if(this.timeToListenLeft >= 0){
			this.startListening()
			return true
		}
		return false
	}
	generateProfile(scriptPath){
		generateProfile(scriptPath)
		#Persistent
			SetTimer, countdown, 1000
		return

		countdown:
			FRAn.timeWentBy()
		return
	}
}

; new FRAn()

