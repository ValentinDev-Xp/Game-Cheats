-- Update the key and date using the provided function
return function(updateFunction)
    local newKey = "new_key"
    local newDate = "2023-12-31"  -- Replace with the desired new date
    
    updateFunction(newKey, newDate)
end
