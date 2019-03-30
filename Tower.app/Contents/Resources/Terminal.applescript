on execute(filename)
    tell application "Terminal"
        if (exists front window) then
            do script "cd " & quoted form of filename in the front window
        else
            do script "cd " & quoted form of filename
        end if

        activate
    end tell
end execute
