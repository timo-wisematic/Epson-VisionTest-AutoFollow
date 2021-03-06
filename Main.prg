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
	
	Motor On
	Power High
	Tool 1
	Jump safept
	' Jump camshot
	
	Do
		ResetElapsedTime
		VRun Arrow
		VGet Arrow.ArrowLocate.RobotXYU, found, x, y, u
		
		If found Then
			Print "Arrow found, time (s): ", ElapsedTime
			Arm 1
			Go XY(x, y, -10, u)
			Arm 0
		Else
			Print "Arrow NOT found, time (s):", ElapsedTime
		EndIf
	Loop
Fend
Function TableCam_test_1
	Real CamX, CamY, CamU
	Boolean found
	
	Motor On
	Power High
	Tool 1
	Jump TableCam_Center
	
	ResetElapsedTime
	VRun TableCam_test_1
	VGet TableCam_test_1.SuctionTool.RobotXYU, found, CamX, CamY, CamU
	
	If found Then
		Print "Tool found, time (s): ", ElapsedTime
		Print "X Diff: ", CX(Here) - CamX
		Print "Y Diff: ", CY(Here) - CamY
		Print "U Diff: ", CU(Here) - CamU
		
	Else
		Print "Tool NOT found, time (s):", ElapsedTime
	EndIf
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


