on execute(filename)
    set command_string to "cd " & quoted form of filename
    
    if application "iTerm" is running then
        tell application "iTerm"
            activate
            try
                select first window
                set onlywindow to false
                on error
                create window with default profile
                select first window
                set onlywindow to true
            end try
            tell the first window
                if onlywindow is false then
                    create tab with default profile
                end if
                tell current session to write text command_string
            end tell
        end tell
    else
        tell application "iTerm"
            activate
            delay 1
            try
                select first window
                on error
                create window with default profile
                select first window
            end try
            tell the first window
                tell current session to write text command_string
            end tell
        end tell
    end if
end execute