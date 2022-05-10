

local items = {}
local result = MySQL.Sync.fetchScaler('SELECT items FROM stashitems WHERE stash = ?', {stashID})
    if result then
        local stashItems = json.decode(result)
        if stashItems then
            for _,v in pairs(items) do
                local itemInfo = QBCore.Shared.Items[v.name:lower()]
                if itemInfo then
                    items[v.slot] = {
                        name = itemInfo['name'],
                        amount = tonumber(v.amount),
                    }
                end
            end
        end
    end
    return items
