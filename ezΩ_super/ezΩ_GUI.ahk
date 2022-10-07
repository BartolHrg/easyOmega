#NoEnv
SetWorkingDir, %A_ScriptDir%
ico_path := "./omega_bold_x.png"
Icon [ico_path]
Menu, Tray, Icon, %ico_path%
#SingleInstance, Force

#Include, UIAutomation/Lib/UIA_Interface.ahk
#Include, data.ahk

uia := UIA_Interface()
current := ""

myStart(initial := "") {
	global uia, current, my_in
	current := uia.GetFocusedElement()
	Gui, MyName:New, , ezΩ GUI
	Gui, MyName:Add, Edit, vmy_in r1 w200
	GuiControl, , my_in, %initial%
	Gui, MyName:Show,
	SoundBeep, 600, 100
}

myClose() {
	global current
	Gui, MyName:Destroy
	current.SetFocus()
}
myCancel() {
	myClose()
}
myTry() {
	global my_in
	Gui, MyName:Submit
	replacement := myFind(my_in, found)
	If (found) {
		myClose()
		Send, %replacement%
	} Else {
		SoundBeep, 300, 100
	}
}

SC029::
	myStart()
Return
$Tab::
	If (WinActive("ezΩ GUI")) {
		myTry()
	} Else {
		Send, {Tab}
	}
Return
MyNameGuiClose:
	myCancel()
Return
$Esc::
	If (WinActive("ezΩ GUI")) {
		myClose()
	} Else {
		Send, {Esc}
	}
Return
