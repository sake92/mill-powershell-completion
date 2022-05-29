# mill-powershell-completion

Basic TAB completion for Mill in PowerShell


1. Create profile if doesnt exist and open it:
```powershell
if (!(Test-Path -Path $PROFILE.CurrentUserAllHosts)) {
  New-Item -ItemType File -Path $PROFILE.CurrentUserAllHosts -Force
}

ii $PROFILE.CurrentUserAllHosts
```

1. Copy the contents of the `profile.ps1` script into your profile.  
Close the file.

1. Open a fresh PowerShell console

1. Enter a Mill project folder, type `mill` and hit `TAB` !


---
You might need to enable the scripts execution policy, if you get an error after updating the profile file:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```


Useful links:
https://dev.to/ofhouse/add-a-bash-like-autocomplete-to-your-powershell-4257
https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/ise/how-to-use-profiles-in-windows-powershell-ise
