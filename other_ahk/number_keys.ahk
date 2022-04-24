#InputLevel 1

1::SendEvent, {!}
$+1::SendEvent, ~


2::SendEvent, "
$+2::SendEvent, ˇ{Space}


3::SendEvent, {#}
$+3::SendEvent, {^}{Space}


4::SendEvent, $
$+4::SendEvent, ˘{Space}


5::SendEvent, `%
;{Asc 0037}
$+5::SendEvent, °{Space}


6::SendEvent, &
$+6::SendEvent, ˛{Space}


7::SendEvent, \
$+7::SendEvent, ``


8::SendEvent, (
$+8::SendEvent, ˙{Space}


9::SendEvent, )
$+9::SendEvent, ´{Space}


$0::SendEvent, =
$+0::SendEvent, ˝{Space}

#InputLevel 0

<^>!SC029::
MsgBox, 4, , Do you want to exit app 
IfMsgBox, No
	Return
ExitApp
Return