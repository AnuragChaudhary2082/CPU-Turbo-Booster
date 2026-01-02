Set shell = CreateObject("WScript.Shell")
shell.Run "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File ""optimize.ps1""", 0, False