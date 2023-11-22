
# set cursor to be at end automatically
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

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
		# chop off everything after last DOT
		# append ._
		$wordToCompleteNoDot = $wordToComplete -replace '\.[a-zA-Z0-9]*$', ''
		$wordToCompleteAdapted = "${wordToCompleteNoDot}._"
		mill --disable-ticker resolve $wordToCompleteAdapted 
    }
}

Register-ArgumentCompleter -Native -CommandName mill -ScriptBlock $millScriptBlock
