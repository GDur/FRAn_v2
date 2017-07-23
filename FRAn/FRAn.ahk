#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
; FRAn Frendly Replicator Android

; this script will react to 'OK Fran' and only after saying it will it perform commands
; it will countdown from 5 seconds to 0 and only in that time it will follow commands
; chaining commands: after performing a command the timer is reset to 5 seconds again

#Include %A_LineFile%/../TextToSpeech.ahk
#Include %A_LineFile%/../ProfileGenerator.ahk
#Include %A_LineFile%/../SendViaClipboard.ahk


SplitPath, A_LineFile,, FRAnsDirectory
Run,  %FRAnsDirectory%/../GAVPI/GAVPI.exe , , , OutputVarPID
WinWait ahk_pid %OutputVarPID%
if ErrorLevel
{
    MsgBox, GAVPI did not start in time.
    return
}
else {
	WinShow
	WinActivate

}
return


class FRAn
{	
	timeWentBy() {
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
