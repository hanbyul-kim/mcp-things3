tell application "Things3"
    set todoList to selected to dos
    set todoJSON to "["
    set todoCount to count of todoList

    repeat with i from 1 to todoCount
        set t to item i of todoList
        set todoTitle to my jsonEscape(name of t)
        set todoNotes to ""
        if notes of t is not missing value then
            set todoNotes to my jsonEscape(notes of t)
        end if

        set todoJSON to todoJSON & "{\"title\": \"" & todoTitle & "\"," & ¬
            "\"notes\": \"" & todoNotes & "\"}"

        if i is not todoCount then
            set todoJSON to todoJSON & ","
        end if
    end repeat

    set todoJSON to todoJSON & "]"

    return todoJSON
end tell