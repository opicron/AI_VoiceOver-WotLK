setfenv(1, VoiceOver)
Debug = {}

function Debug:Print(msg, header)
    if Addon.db.profile.DebugEnabled then
        -- Hide prints containing specific patterns
        local msgStr = tostring(msg)
        local headerStr = header and tostring(header) or ""
        
        -- Hide specific patterns
        if string.find(msgStr, "for file: 0%-accept") or 
           string.find(msgStr, 'filename "0%-accept"') or
           string.find(msgStr, "PrepareSound: Checking gendered: f%-%d+%-accept and non%-gendered: %d+%-accept") or
           string.find(headerStr, "for file: 0%-accept") or 
           string.find(headerStr, 'filename "0%-accept"') or
           string.find(headerStr, "PrepareSound: Checking gendered: f%-%d+%-accept and non%-gendered: %d+%-accept") then
            return
        end
        
        -- Hide other specific patterns
        if string.find(msgStr, "GUID: nil") or 
           string.find(msgStr, "No NPCID found in GUID") or
           string.find(msgStr, "PrepareSound: fileName not provided, determining using getFileNameForEvent for event: QuestAccept") then
           return
        end
        
        if header then
            print(Utils:ColorizeText("VoiceOver", NORMAL_FONT_COLOR_CODE) ..
                Utils:ColorizeText(" (" .. header .. ")", GRAY_FONT_COLOR_CODE) ..
                " - " .. msg)
        else
            print(Utils:ColorizeText("VoiceOver", NORMAL_FONT_COLOR_CODE) ..
                " - " .. msg)
        end
    end
end
