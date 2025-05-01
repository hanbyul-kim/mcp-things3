tell application "Things3"
    set todoList to selected to dos
    set todoJSON to "["
    
    repeat with t in todoList
        set todoTitle to name of t
        set todoNotes to ""
        if notes of t is not missing value then
            set todoNotes to notes of t
        end if
        
        set todoJSON to todoJSON & "{\"title\": \"" & todoTitle & "\"," & ¬
            "\"notes\": \"" & todoNotes & "\"}" 
            
        if t is not last item of todoList then
            set todoJSON to todoJSON & ","
        end if
    end repeat
    
    set todoJSON to todoJSON & "]"
    
    return todoJSON
end tell