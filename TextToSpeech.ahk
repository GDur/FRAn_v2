#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

speak(blub) {
	global oVoice, Status, tmpLanguage, voiceChoice
	
	oVoice        := ComObjCreate("SAPI.SpVoice")
	Status        := oVoice.Status.RunningState
	oVoice.volume := 100
	oVoice.rate   := 1
	
	; check for language
	language      := tmpLanguage
	
	array := {	english: "809", deutsch: "407"}
	
	; recognizeLanguage(blub)
	;MsgBox % language
	message       := array["english"] "TTS Stimme: "
	
	; this list might help: https://msdn.microsoft.com/en-us/library/office/hh361638(v=office.14).aspx
	if(language = "default"){
		message       := "TTS Voice: "
		oVoice.voice  := oVoice.GetVoices("", "Language=407").Item(voiceChoice)
	}
	; else use default which depends on your system settings
	
	
	; trace(message oVoice.voice.GetDescription)

	
	; send it to TTS
	
	Status    := oVoice.Status.RunningState
	if Status = 0   ; paused
		oVoice.Resume
	oVoice.Speak("",0x1|0x2)   ; stop
	;oVoice.Speak(blub)   ; speak asynchronously
	oVoice.Speak(blub,0x1)   ; speak asynchronously
}