SetTitleMatchMode, 2

; C:\Users\Bartol\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

cond() {
	Return (WinActive("Discord") Or WinActive("WhatsApp"))
}

$Enter::
If cond() {
	Send, {ShiftDown}{Enter}{ShiftUp}
} Else {
	Send, {Enter}
}
Return
$NumpadEnter::
If cond() {
	Send, {ShiftDown}{NumpadEnter}{ShiftUp}
} Else {
	Send, {NumpadEnter}
}
Return

$^Enter::
If cond() {
	Send, {Enter}
} Else {
	Send, {Control}{Enter}
}
Return
$^NumpadEnter::
If cond() {
	Send, {NumpadEnter}
} Else {
	Send, {Control}{NumpadEnter}
}
Return

+^d::
MsgBox, 0, , Exiting
ExitApp, 0
Return
