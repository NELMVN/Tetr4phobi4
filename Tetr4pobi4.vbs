Option Explicit ' * v1.0.0.0 | Copyright ⓒ github.com/NELMVN
' ************************************************************************************
' *
' *    Tetr4pobi4
' *
' ************************************************************************************

Private Cell(3), Pointer

Compiler CStr(Wscript.Arguments.Item(0)) : Private Sub Compiler(Source)
    Dim FSO, sourceFile, sourceText, compiledSourceCode
    Dim this, Line, hasComment

    Set FSO = CreateObject("Scripting.FileSystemObject")
    Cell(0) = 0: Cell(1) = 0: Cell(2) = 0: Cell(3) = 0
    Pointer = 0

    If InStrB(Source, ".444") > 0 Then
        If FSO.FileExists(Source) Then
            Set sourceFile = FSO.OpenTextFile(Source, 1)

            While Not sourceFile.AtEndOfStream
                Line = CStr(sourceFile.ReadLine)
                Line = Replace(Line, Chr(32), vbNullString)

                hasComment = InStr(Line, "{44}")
                If hasComment > 0 Then
                    If StrComp(Line, "{44}") <> 0 Then Line = Mid(Line, 1, hasComment - 1)
                End If

                If StrComp(Line, vbNullString) <> 0 And StrComp(Line, "{44}") <> 0 Then
                    sourceText = sourceText + Line + "$$$$"
                End If
            Wend
            sourceFile.Close
            sourceText = Left(sourceText, Len(sourceText) - 4)

            For Each this in Split(sourceText, "$$$$")
                If StrComp(this, "4444") = 0 Then
                    If Cell(Pointer) > 127 Then
                        Cell(Pointer) = 52
                    End If

                    Wscript.Stdout.Write(Chr(Cell(Pointer)))

                ElseIf StrComp(this, "44UR") = 0 Then
                    Pointer = Pointer - 1
                
                ElseIf StrComp(this, "FO44") = 0 Then
                    Pointer = Pointer + 1

                ElseIf StrComp(this, "4OUR") = 0 Then
                    Cell(Pointer) = Cell(Pointer) + 4

                ElseIf StrComp(this, "FOU4") = 0 Then
                    Cell(Pointer) = Cell(Pointer) - 4

                ElseIf StrComp(this, "FFFR") = 0 Then
                    ' Not implement yet

                ElseIf StrComp(this, "RRRF") = 0 Then
                    ' Not implement yet

                ElseIf StrComp(this, "four") = 0 Then
                    Cell(Pointer) = Cell(Pointer) / 4

                ElseIf StrComp(this, "fuor") = 0 Then
                    Cell(Pointer) = Cell(Pointer) * 4

                ElseIf StrComp(this, "ffff") = 0 Then
                    Cell(Pointer) = 0

                Else
                    Wscript.Stdout.Write("Error 444: " + this + " is not a valid command.")
                    Exit Sub

                End If
            Next
            Set sourceFile = Nothing
        Else
            Wscript.Stdout.Write("Error 444: File does not exist.")
        End If
    Else
        Wscript.Stdout.Write("Error 444: Invalid file type.")
    End If

    Set FSO = Nothing
End Sub
