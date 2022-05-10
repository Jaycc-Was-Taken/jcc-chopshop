local QBCore = exports['qb-core']:GetCoreObject()
local chopGroups = {}
local chopQueueNumber = 0
local usedPlates = {}
local sleep = 1 * 1000
AddEventHandler('onResourceStart', function (resource)
    if resource == GetCurrentResourceName() then
       chopQueue()
    end
end)
function updateChopStage(groupID)
    local jobID = FindChopGroupByID(groupID)
    local members = exports["ps-playergroups"]:getGroupMembers(groupID)
    chopGroups[jobID]['stage'] = chopGroups[jobID]['stage'] + 1
    Wait(10) --Stage 0 is when the group has been made and signed up for job, but not in queue
    if chopGroups[jobID]['stage'] == 1 then -- In queue
        chopGroups[jobID]['inqueue'] = true
        for i=1, #members do
            TriggerClientEvent("QBCore:Notify", members[i], "Wait until a job comes up.", "primary")
        end
    elseif chopGroups[jobID]['stage'] == 2 then -- got job
        local leaderSrc = exports['ps-playergroups']:getgroupLeader(groupID)
        local leader = QBCore.Functions.GetPlayer(leaderSrc)
        local leaderCid = leader.PlayerData.citizenid
        local groupCar = math.random(#Config.CarTypes)
        local groupPickup = GetRandomLocation()
        local groupVehPlate = GenerateRandomPlate()
        chopGroups[jobID]['pickup'] = groupPickup
        chopGroups[jobID]['carnum'] = groupCar
        chopGroups[jobID]['carplate'] = groupVehPlate
        chopGroups[jobID]['carparts'] = Config.CarTypes[groupCar].parts
        Config.CarLocations[groupPickup].occupied = true
        TriggerClientEvent('qb-phone:client:button', leadercid, {
            title = "Chop Shop",
            text = "I have a job for you.",
            button = true,
            buttonData = {
                buttonTrue = {
                    buttonEvent = "chopshop:leaderAcceptedJob",
                    data = {
                        type = 'server',
                        groupID = groupID,
                    },
                },
                buttonFalse = {
                    buttonEvent = 'chopshop:leaderDeclinedJob',
                    data = {
                        type = 'server',
                        groupID = groupID,
                    },
                }
            }
        })
    elseif chopGroups[jobID]['stage'] == 3 then --Leader accepted job email, send blip to all members
        local xOffset = math.random(1,2)
        local xROffset = math.random(1,100)
        if xOffset == 1 then
            xROffset = (0 - math.random(1,100))
        end
        local yOffset = math.random(1,2)
        local yROffset = math.random(1,100)
        if yOffset == 1 then
            yROffset = (0 - math.random(1,100))
        end
        local pickupNum = chopGroups[jobID]['pickup']
        local pickup = Config.CarLocations[pickupNum]
        local blipData = {
            x = pickup.coords.x + xROffset, 
            y = pickup.coords.y + yROffset, 
            z = currentLocation.z,
        }
        for i=1, #members do
            TriggerClientEvent('chopshop:createVehicleBlip', members[i], blipData, pickupNum)
        end
    elseif chopGroups[jobID]['stage'] == 4 then --Group has stolen vehicle
        for i=1, #members do
            TriggerClientEvent('chopshop:sendGroupToDrop', members[i]) --Will eventually make multiple drop locations
            TriggerClientEvent("QBCore:Notify", members[i], "Head to the chop shop.", "primary")
        end
    elseif chopGroups[jobID]['stage'] == 5 then --Group is at chop shop
        for i=1, #members do
            TriggerClientEvent("QBCore:Notify", members[i], "Take apart the vehicle.", "primary")
        end
    elseif chopGroups[jobID]['stage'] == 6 then --Group has finished car, leave area
        for i=1, #members do
            TriggerClientEvent("QBCore:Notify", members[i], "Make sure theres no cops and leave the area.", "primary")
        end
    elseif chopGroups[jobID]['stage'] == 7 then --Group has left area, job over
        for i=1, #members do
            TriggerClientEvent("QBCore:Notify", members[i], "Good job.", "primary")
        end
        TriggerEvent('chopshop:endGroupJob', groupID)
    end
end
RegisterServerEvent('chopshop:createChopGroup', function(groupID)
    if FindChopGroupByID(groupID) == 0 then
        chopGroups[#chopGroups+1] = {
            groupID = groupID,
            stage = 0,
            inqueue = false,
            onjob = false,
            pickup = 0,
            carnum = 0,
            dropoff = 0,
            carplate = 0,
            vehspawned = false,
            carparts = 0,
            choppedparts = 0,
            carid = 0,
            carfinished = false,
        }
        exports['ps-playergroups']:setJobStatus(groupID, "CHOP SHOP")
    end
end)
RegisterServerEvent('chopshop:disbandChopGroup', function(groupID)
    local jobID = FindChopGroupByID(groupID)
    local members = exports["ps-playergroups"]:getGroupMembers(groupID)
    if jobID ~= 0 then
        chopGroups[jobID] = nil
        exports['ps-playergroups']:setJobStatus(groupID, "WAITING")
    end
end)
RegisterServerEvent('chopshop:spawnCarForGroup', function(groupID)
    local jobID = FindChopGroupByID(groupID)
    if not chopGroups[jobID]['vehspawned'] then
        chopGroups[jobID]['vehspawned'] = true
        CreateThread(function()
            local carNum = chopGroups[jobID]['carnum']
            local hash = Config.CarTypes[carNum].type
            local spawnLoc = chopGroups[jobID]['pickup']
            local plate = chopGroups[jobID]['carplate']
            local coords = vector3(Config.CarLocations[spawnLoc].coords.x, Config.CarLocations[spawnLoc].coords.y, Config.CarLocations[spawnLoc].coords.z)
            local veh = CreateVehicle(hash, coords, Config.CarLocations[spawnLoc].coords.w, true, true)
            while not DoesEntityExist(veh) do
                veh = CreateVehicle(hash, coords, Config.CarLocations[spawnLoc].coords.w, true, true)
                Wait(100)
            end
            if DoesEntityExist(veh) then
                SetVehicleNumberPlateText(veh, tostring(plate))
                SetVehicleDoorsLocked(veh, 2)
                SetEntityDistanceCullingRadius(veh, 999999999.0)
                Wait(500) --For setting plate
                chopGroups[jobID]['carid'] = veh
            end
        end)
    end
end)
RegisterServerEvent('chopshop:groupAtChopShop', function(groupID)
    local jobID = FindChopGroupByID(groupID)
    local vehID = chopGroups[jobID]['carid']
    local availableParts = GetVehicleAvailableParts(vehID)
    if availableParts < chopGroups[jobID]['parts'] then
        chopGroups[jobID]['parts'] = availableParts
    end
    local members = exports["ps-playergroups"]:getGroupMembers(groupID)
    for i=1, #members do
        TriggerClientEvent('chopshop:sendGroupTargets', members[i], vehID)
    end
    updateChopStage(groupID)
end)
RegisterServerEvent('chopshop:chopPart', function(groupID, part, partID)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local jobID = FindChopGroupByID(groupID)
    local veh = NetworkGetNetworkIdFromEntity(chopGroups[jobID]['carid'])
    if chopGroups[jobID]['choppedparts'] < chopGroups[jobID]['carparts'] then
        chopGroups[jobID]['choppedparts'] = chopGroups[jobID]['choppedparts'] + 1
        if part == 'tyre' then
            SetVehicleTyreBurst(veh, partID, true, 1000.0)
            local item = 'rubber'
            local amount = math.random(2,6)
            Player.Functions.AddItem(item, amount, false, {}, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        elseif part == 'boot' then
            SetVehicleDoorBroken(veh, partID, 1)
            local luck = math.random(1,10)
            local item = 'aluminum'
            if luck >= 8 then
                item = 'steel'
            end
            local amount = math.random(8,13)
            Player.Functions.AddItem(item, amount, false, {}, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        elseif part == 'door' then
            SetVehicleDoorBroken(veh, partID, 1)
            local luck = math.random(1,10)
            local item = 'aluminum'
            if luck >= 8 then
                item = 'glass'
            end
            local amount = math.random(8,13)
            Player.Functions.AddItem(item, amount, false, {}, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        elseif part == 'bonnet' then
            SetVehicleDoorBroken(veh, partID, 1)
            local luck = math.random (1,10)
            local item = 'glass'
            if luck >= 8 then
                item = 'plastic'
            end
            local amount = math.random(8,13)
            Player.Functions.AddItem(item, amount, false, {}, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        end
    end
end)
RegisterServerEvent('chopshop:finishVehicle', function(groupID)
    local jobID = FindChopGroupByID(groupID)
    local veh = NetworkGetNetworkIdFromEntity(chopGroups[jobID]['carid'])
    if chopGroups[jobID]['choppedparts'] >= chopGroups[jobID]['carparts'] then
        if not chopGroups[jobID]['carfinished'] then
            chopGroups[jobID]['carfinished'] = true
            DeleteEntity(chopGroups[jobID]['carid'])
            for i = 1, math.random(2,3), 1 do
                local item = Config.Items[math.random(1, #Config.Items)]
                local amount = math.random(15,20)
                Player.Functions.AddItem(item, amount, false, {}, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
            end
            updateChopStage(groupID)
        end
    end
end)
RegisterServerEvent('chopshop:updateLeftArea', function(groupID)
    local src = source
    local jobID = FindChopGroupByID(groupID)
    local members = exports["ps-playergroups"]:getGroupMembers(groupID)
    if chopGroups[jobID]['stage'] == 6 then
        chopGroups[jobID]['leftarea'] = chopGroups[jobID]['leftarea'] + 1
        local groupAmount = 0
        for i=1, #members do
            groupAmount = groupAmount + 1
        end --i dont know why i couldn't get it to work with just groupAmount = #members but it wouldn't
        Wait(10)
        if chopGroups[jobID]['leftarea'] == groupAmount then
            updateStage(groupID)
        end
    end
end)
RegisterServerEvent('chopshop:endGroupJob', function(groupID)
    local jobID = FindChopGroupByID(groupID)
    local members = exports["ps-playergroups"]:getGroupMembers(groupID)
    if jobID ~= 0 then
        chopGroups[jobID] = {
            groupID = groupID,
            stage = 0,
            inqueue = false,
            onjob = false,
            pickup = 0,
            carnum = 0,
            dropoff = 0,
            carplate = 0,
            vehspawned = false,
            carparts = 0,
            choppedparts = 0,
            carid = 0,
            carfinished = false,
        }
    end
    for i=1, #members do
        TriggerClientEvent('chopshop:cleanUp', members[i])
        TriggerClientEvent("QBCore:Notify", members[i], "Group removed from Chop Shop list.", "primary")
    end
end)
--Queue system reworked from jl-carboost https://github.com/JustLazzy/jl-carboost
local ChopQueueList = {}
RegisterServerEvent('chopshop:joinQueue', function (groupID)
    local jobID = FindChopGroupByID(groupID)
    local status = chopGroups[jobID]['inqueue']
    if not status then
       ChopQueueList[jobID] = {
          inQueue = true,
          groupID = groupID
       }
       chopQueueNumber = chopQueueNumber + 1
       updateChopStage(groupID)
    else
       ChopQueueList[jobID] = nil
       chopGroups[jobID]['inqueue'] = false
       chopQueueNumber = chopQueueNumber - 1
       if chopQueueNumber < 0 then
        chopQueueNumber = 0
       end
       TriggerEvent('chopshop:endGroupJob', groupID)
    end
end)
function chopQueue()
    if chopQueueNumber ~= 0 then
        Wait(1 * 1000 * 60)
        local group = math.random(#ChopQueueList)
        while not ChopQueueList[group].inQueue do
            group = math.random(#ChopQueueList)
            Wait(100)
        end
        if ChopQueueList[jobID].inQueue then
            local jobID = FindChopGroupByID(ChopQueueList[jobID].groupID)
            ChopQueueList[jobID].inQueue = false
            chopGroups[jobID]['inqueue'] = false
            chopGroups[jobID]['onjob'] = true
            updateChopStage(ChopQueueList[jobID].groupID)
            chopQueueNumber = chopQueueNumber - 1
        end
    end
    SetTimeout(sleep, function ()
       chopQueue()
    end)
end
function FindChopGroupByID(id)
    for i=1, #chopGroups do
        if chopGroups[i]["groupID"] == id then
            return i
        end
    end
    return 0
end
function GetRandomLocation()
    local randomLocation = math.random(Config.CarLocations)
    while Config.CarLocations[randomLocation].occupied do
        randomLocation = math.random(Config.CarLocations)
        Wait(100)
    end
    return randomLocation
end
function GenerateRandomPlate()
    local plate = tostring(math.random(10,99)).."J"..tostring(math.random(10,99)).."C"..tostring(math.random(10,99))
    while usedPlates[plate] == true do
        plate = tostring(math.random(10,99)).."J"..tostring(math.random(10,99)).."C"..tostring(math.random(10,99))
        Wait(100)
    end
    usedPlates[plate] = true
    return plate
end
function GetVehicleAvailableParts(vehID)
    local veh = NetworkGetNetworkIdFromEntity(vehID)
    local totalParts = 0
    if DoesEntityExist(veh) then
        for i=0,5,1 do
            if DoesVehicleTyreExist(veh, i) then 
                if not IsVehicleTyreBurst(veh, i, true) then
                    totalParts = totalParts + 1
                end
            end
        end
        local doors = GetNumberofVehicleDoors(veh)
        if doors > 0 then
            for d=0,#doors,1 do
                if GetIsDoorValid(veh, d) then
                    if IsVehicleDoorDamaged(veh, d) == false then
                        totalParts = totalParts + 1
                    end
                end
            end
        end
    end
    return totalParts
end