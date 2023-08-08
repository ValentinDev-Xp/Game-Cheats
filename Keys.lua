-- Function to update the key and date via GUI
local function updateKeyAndDateGUI()
    local newKey = textBox.Text
    local newDate = "2023-12-31"  -- Replace with the desired new date
    
    updateKeyAndDate(newKey, newDate)
end
