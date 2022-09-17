#SingleInstance, force
SetTitleMatchMode, 2


; ===========================

; search for MODIFY in this document

; ===========================


; MODIFY
; you change this to any key (or combination, see https://www.autohotkey.com/docs/Hotkeys.htm)
; for example ctrl + esc to exit
; ^Esc::ExitApp, 0
F7::ExitApp, 0


init() {
	Send, ^+i
	Sleep, 4000
	mySleep()
	Loop, 9 {
		Send, {Tab}
		mySleep()
	}
	Send, {Enter}
	mySleep()
	Send, {Esc}
	mySleep()
	Loop, 13 {
		Send, +{Tab}
		mySleep()
	}
	Loop, 2 {
		Send, {Right}
		; Send, ^]
		mySleep()
	}
	exitInspectElement() 
}

mySleep() {
	; MODIFY
	; you can lower this to make it faster
	; minimally 100 ms
	; would not recommend to do it 
	Sleep, 1000 ; ms
}

enterEditor() {
	Send, ^+i
	Sleep, 1500
	mySleep()
	Loop, 4 {
		Send, {Tab}
		mySleep()
	}
}
exitInspectElement() {
	; MODIFY
	; for devtools in separate window
	; Send, !{F4}
	; for docked devtools
	Send, ^+i
}


collapsed := False

collapse(only_unread) {
css_base := ""
	. "li.containerDefault-YUSmu3"
	. ":not(li.containerDefault-3TQ5YN~li.containerDefault-YUSmu3)"
	. ":not(.selected-2TbFuo)"

css_filter := ">:not(.modeUnread-3Cxepe)"
css_body := "
(
 * {
    height: 0px;
}
)"
    ; background: red; 
css := css_base css_body
css_filtered := css_base css_filter css_body
	; global css, css_filtered
	; MsgBox, % css
	; Return
	tmpclp := ClipboardAll
	If (only_unread) {
		Clipboard := css_filtered
	} Else {
		Clipboard := css
	}
	Sleep, 200
	enterEditor()
	Send, ^a
	Sleep, 100
	mySleep()
	Send, ^v
	mySleep()
	Sleep, 200
	exitInspectElement()
	Clipboard := tmpclp
	tmpclp = ""
	collapsed := True
}

expand() {
	enterEditor()
	; Send, {Right}
	; Sleep, 100
	Send, ^a
	Sleep, 100
	mySleep()
	Send, {BackSpace}
	Sleep, 200
	mySleep()
	; Send, ^s
	; mySleep()
	exitInspectElement()
	collapsed := False
}

toggleCollapse(only_unread) {
	If (collapsed) {
		expand()
	} Else {
		collapse(only_unread)
	}
}

#IfWinActive, Discord, 

; MODIFY
; you change these to any keys (or combination, see https://www.autohotkey.com/docs/Hotkeys.htm)

; init can be done manually: (it's probably better to do it manually)
	; open inspect element
	; in styles tab (to the right) click +
	; select inspector-stylesheet
	; and then double-click underlined inspector-stylesheet that will be right of the rule like `body {`
	; exit inspect element
F2::init()

F3::collapse(True)
F4::collapse(False)
F5::expand()
