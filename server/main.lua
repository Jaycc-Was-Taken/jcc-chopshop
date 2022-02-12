local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('jcc-chopshop:server:chopVehicle', function(part)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if part == 'tyre' then
        local item = 'rubber'
        local amount = math.random(3,8)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
    elseif part == 'boot' then
        local luck = math.random(1,10)
        local item = 'aluminum'
        if luck >= 8 then
            item = 'steel'
        end
        local amount = math.random(10,15)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
    elseif part == 'door' then
        local luck = math.random(1,10)
        local item = 'aluminum'
        if luck >= 8 then
            item = 'glass'
        end
        local amount = math.random(10,15)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
    elseif part == 'bonnet' then
        local luck = math.random (1,10)
        local item = 'glass'
        if luck >= 8 then
            item = 'plastic'
        end
        local amount = math.random(10,15)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
    elseif part == 'bodyshell' then
        for i = 1, math.random(2,3), 1 do
            local item = Config.Items[math.random(1, #Config.Items)]
            local amount = math.random(15,20)
            Player.Functions.AddItem(item, amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        end
    end
end)