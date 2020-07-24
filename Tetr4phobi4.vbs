Option Explicit

Const FILE_TYPE     = "444"
Const ERROR_MSG     = "[Tetr4phobi4 Error]"
Const REGEX_COMMENT = " +|\{44\}.*|(\r\n|\n|\r){2,}"
Const REGEX_DOLLARS = "\${4}"

Private lineCount  : lineCount   = 0

Private Cell(3): Cell(0) = 0: Cell(1) = 0: Cell(2) = 0: Cell(3) = 0
Private Pointer: Pointer = 0
Private FSO: set FSO = CreateObject("Scripting.FileSystemObject")
Private Halt: Halt = False
Private Optimization: Optimization = False

Private regexNullComment: Set regexNullComment = New RegExp
regexNullComment.Pattern = REGEX_COMMENT
regexNullComment.Global  = True

Private regexSSSSCommand: Set regexSSSSCommand = New RegExp
regexSSSSCommand.Pattern = REGEX_DOLLARS
regexSSSSCommand.Global  = True

Private Sub ERROR(msg): WScript.StdErr.Write vbCrLf & ERROR_MSG & vbTab & ">>" & vbTab & msg: End Sub

Begin WScript.Arguments: Private Sub Begin(Param)

    Select Case WScript.Arguments.Count
        Case 0
            ERROR "[Input Error]" & vbTab & ">>" & vbTab & "[nil]" & vbTab & ">>" & vbTab & "There is no arguments." & vbCrLf
        Case 1, 2
            If FSO.GetExtensionName(Param(0)) = FILE_TYPE Then
                if FSO.FileExists(Param(0)) then
                    Dim sourceFile: Set sourceFile = FSO.OpenTextFile(Param(0), 1)
                    Dim Line

                    If WScript.Arguments.Count = 2 Then
                        Optimization = Param(1) = "-optimize"
                    End If

                    Dim optimizedFile: If Optimization Then
                        WScript.Stdout.Write vbCrLf & "[Tetr4phobi4]" & vbTab & ">>" & vbTab & "[-optimize]" & vbTab & "Initialize optimization....." & vbCrLf & vbCrLf
                        ' WScript.Stdout.Write "[" & FSO.GetParentFolderName(WScript.ScriptFullName) & "\444-optimized\" & FSO.GetBaseName(Param(0)) & "-optimized.444" & "]" & vbCrLf
                        Set optimizedFile = FSO.CreateTextFile(FSO.GetParentFolderName(WScript.ScriptFullName) & "\" & FSO.GetBaseName(Param(0)) & "-optimized.444")
                    End If

                    Do While Not sourceFile.AtEndOfStream
                        lineCount = lineCount + 1
                        Line = regexNullComment.Replace(sourceFile.ReadLine, vbNullString)

                        If Line <> vbNullString Then
                            Line = regexSSSSCommand.Replace(Line, vbCrLf)

                            Dim Command: For Each Command In Split(Line, vbCrLf)
                                If Optimization Then optimizedFile.WriteLine Command

                                Select Case Command
                                    Case "4444"
                                        If Cell(Pointer) > 127 Then Cell(Pointer) = 52
                                        WScript.Stdout.Write Chr(Cell(Pointer))
                                    Case "44UR"
                                        If Pointer - 1 >= 0 Then Pointer = Pointer - 1
                                    Case "FO44"
                                        If Pointer + 1 <= 3 Then Pointer = Pointer + 1
                                    Case "4OUR"
                                        If Cell(Pointer) + 4 <= 4444 Then Cell(Pointer) = Cell(Pointer) + 4
                                    Case "FOU4"
                                        If Cell(Pointer) - 4 >= 0 Then Cell(Pointer) = Cell(Pointer) - 4
                                    Case "four"
                                        If Cell(Pointer) > 0 Then Cell(Pointer) = Cell(Pointer) / 4
                                    Case "fuor"
                                        Cell(Pointer) = Cell(Pointer) * 4
                                    Case "ffff"
                                        Cell(Pointer) = 0
                                    Case Else
                                        If Command = vbNullString Then
                                            ERROR "[Line " & lineCount & "]" & vbTab & ">>" & vbTab & "[nil]" & vbTab & ">>" & vbTab & "Invalid command." & vbCrLf
                                        Else
                                            ERROR "[Line " & lineCount & "]" & vbTab & ">>" & vbTab & "[" & Command & "]" & vbTab & ">>" & vbTab & "Invalid command." & vbCrLf
                                        End If
                                        
                                        If Optimization Then optimizedFile.WriteLine "[error]"
                                        Halt = True: Exit For
                                End Select
                            Next
                        End If

                        If Halt Then Exit Do
                    Loop

                    If Optimization Then
                        If Halt Then
                            WScript.Stdout.Write vbCrLf & "[Tetr4phobi4]" & vbTab & ">>" & vbTab & "[-optimize]" & vbTab & "Optimization failed." & vbCrLf & vbCrLf
                        Else
                            WScript.Stdout.Write vbCrLf & "[Tetr4phobi4]" & vbTab & ">>" & vbTab & "[-optimize]" & vbTab & "Optimization complete." & vbCrLf & vbCrLf
                        End If

                        optimizedFile.Close
                        Set optimizedFile = Nothing
                    End If

                    sourceFile.Close
                    Set sourceFile       = Nothing
                Else
                    ERROR Param(0) & " not found."
                End If
            Else
                ERROR "Invalid file type."
            End If
        Case Else
            ERROR "[Input Error]" & vbTab & ">>" & vbTab & "[Args(" & WScript.Arguments.Count & ")]" & vbTab & ">>" & vbTab & "Wrong number of arguments." & vbCrLf
    End Select
End Sub

Set FSO = Nothing
Set regexNullComment = Nothing
Set regexSSSSCommand = Nothing
