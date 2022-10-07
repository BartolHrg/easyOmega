#NoEnv
SetWorkingDir, %A_ScriptDir%
#SingleInstance, Force

YYY_REGEX := True
NNN_REGEX := False

StringCaseSense, On

#Include, data.h.ahk

double_replacements := {	"pi": ["ℿ", "ℼ"]
                       ,	"a" : ["𝔸", "𝕒"]	}


; is regex: Bool, regex or str: String, replacer: (source: String, is regex: Bool, regex or str: String, out accepted: Bool) -> String
; starts at [1]
data := [	[NNN_REGEX, "lambda"         , defaultReplacer("λ")  ]
        ,	[YYY_REGEX, "iXS)^double\s*\w+$", Func("doubleReplacer")]	]





; Loop, {
; 	SoundBeep, 400, 100
; 	Sleep, 2000
; }
; a::
; 	; d := data[3]
; 	; f := d[3]
; 	; d := %f%("doublepi", d[1], d[2], acc)
	
; 	; d := "ksmvv"
; 	; c := "d"
; 	; If c Is Lower
; 	; 	d := "h"
	
; 	d := myFind("douBle A", found)
	
; 	MsgBox, %found%? %d%
	
; 	ExitApp, 0
; Return
; Esc::ExitApp, 0