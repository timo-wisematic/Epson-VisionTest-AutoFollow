Function main 'Slow speed tutorial program

	#define ZHeight -xx
	
	Real area, x, y, u
	Boolean found
	Integer answer
	String msg$, answer$
	
	Power Low
	Tool 1
	Jump safept
	
	Do
		Jump camshot
		VRun blobtut
		VGet blobtut.washer.RobotXYU, found, x, y, u
		
		If found = True Then
			VGet blobtut.washer.Area, area
			Print "The washer was found!"
			Print "The washer area is: ", area, "Pixels"
			washpos = XY(x, y, -120.612, u) 'Set pos to move to
			Jump washpos
			msg$ = "The washer found!"
		Else
			msg$ = "The washer was not found!"
		EndIf
		msg$ = msg$ + CRLF + "Run another cycle(Y/N)?"
		
		Print msg$
		
		Input answer$
		
		If UCase$(answer$) <> "Y" Then
			Exit Do
		EndIf
	Loop
Fend
Function autofollow 'Auto follow program
	
	Real x, y, u
	Boolean found
	String msg$
	
	Power Low
	Tool 1
	Jump safept
	' Jump camshot
	
	Do
		
		VRun Arrow
		VGet Arrow.ArrowLocate.RobotXYU, found, x, y, u
		
		If found = True Then
			Print "The arrow was found!"
			washpos = XY(x, y, -10, u) 'Set pos to move to
			Arm 1
			Go washpos
			Arm 0
			msg$ = "The arrow found!"
		Else
			msg$ = "The arrow was not found!"
		EndIf
		' Wait 0.5
		Print msg$
	Loop
Fend

'Function main
'	Real area
'	Boolean found
'	
'	ResetElapsedTime
'	VRun LocateScrewHole
'	VGet LocateScrewHole.screwHole.Found, found
'	Print "Machine vision time (s): ", ElapsedTime
'	
'	If found Then
'		VGet LocateScrewHole.screwHole.Area, area
'		Print "The screw hole was found!"
'		Print "The screw hole  area is: ", area, " pixels"
'	Else
'		Print "Screw hole  was not found!"
'	EndIf
'	
'	Print " "
'Fend


