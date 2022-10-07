#NoEnv
SetWorkingDir, %A_ScriptDir%
#SingleInstance, Force


_defaultReplacer(replacement, source, is_regex, regex_or_str, ByRef accepted) {
	accepted := True
	Return replacement
}
defaultReplacer(replacement) {
	Return Func("_defaultReplacer").Bind(replacement)
}

doubleReplacer(source, is_regex, regex_or_str, ByRef accepted) {
	global double_replacements
	accepted := True
	; doublePi
	; 1234567
	Loop, {
		index := 6 + A_Index
		aA := SubStr(source, index, 1)
		; MsgBox, [%index%] %aA%
		If aA Is Not Space
			Break
	}
	If aA Is Lower ; works even for non letters because will be False, so case_index will be 1
		case_index := 2
	Else
		case_index := 1
	s_id := SubStr(source, index)
	StringLower, my_id, s_id
	; MsgBox, [%s_id% → %my_id%][%case_index%]
	; For key, value in double_replacements {
	; 	MsgBox, k %key% . %value%
	; }
	
	If (Not double_replacements.HasKey(my_id)) {
		accepted := False
		Return ""
	}
	return double_replacements[my_id][case_index]
}

myFind(source, ByRef found) {
	global data
	For key, value in data {
		is_regex := value[1]
		search   := value[2]
		f        := value[3]
		If (is_regex) {
			my_pos := RegExMatch(source, search)
			; MsgBox, %my_pos%
			If (my_pos = 0) {
				Continue
			}
		} Else {
			If (source != search) {
				Continue
			}
		}
		replacement := %f%(source, is_regex, search, accepted)
		; MsgBox, %replacement% . %accepted%
		if (accepted) {
			found := True
			Return replacement
		}
	}
	found := False
	Return "None"
}