# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward



# mill autocomplete
$millScriptBlock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    
    if ([string]::IsNullOrWhitespace($wordToComplete)) { # if empty get all
        mill --disable-ticker resolve _ _._
    } else {
        if ($wordToComplete -match '\.$') { # if ends with . -> append _
            # ZOMG https://stackoverflow.com/questions/17344967/how-can-i-append-an-underscore-to-a-string-variable-in-powershell-without-it-int
            mill --disable-ticker resolve "${wordToComplete}_*"
        } else { # else -> append ._
            mill --disable-ticker resolve "$wordToComplete._"
        }
    }
}

Register-ArgumentCompleter -Native -CommandName mill -ScriptBlock $millScriptBlock
