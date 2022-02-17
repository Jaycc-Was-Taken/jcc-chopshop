local QBCore = exports['qb-core']:GetCoreObject()
local blackOut = false
local blackoutTimer = 0
local CurVehPlate = nil
local assignedVehicle = nil
local currentCar = {}
local currentLocation = {}
local HasAssignment = false
local vehicleSpawned = false 
local RadiusBlip = nil
local DropBlipMade = false
local lastLocation = {}
local lastCar = {}
local hasCar = false
local zoneSpawned = false
local zoneDeleted = false
local assignmentZone = nil
local neededParts = 8
local choppedParts = 0
local Chopping = false
local choppedCar = false
local inChopArea = false
local chopShopZone = CircleZone:Create(vector2(Config.MainLocations.list.x, Config.MainLocations.list.y), 100, {
    name="chopShopZone",
    debugPoly = false,
    minZ = 25.0,
    maxZ = 35.0
   })
local chopShopArea = PolyZone:Create({
    vector2(2343.5139160156, 3060.14453125),
    vector2(2343.7670898438, 3027.0148925781),
    vector2(2329.2336425781, 3026.9626464844),
    vector2(2329.0693359375, 3059.4357910156),
}, {
    name = "chopShopArea",
    debugPoly = false,
    minZ = 46.5,
    maxZ = 60.5,
})
CreateThread(function()
        local LFTyre = {'wheel_lf'}
        exports['qb-target']:AddTargetBone(LFTyre, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopTyre",
                args = {
                    boneIndex = 0,
                    part = 'tyre'
                },
                label = "Chop Tire",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 0.75,
        })
        local RFTyre = {'wheel_rf'}
        exports['qb-target']:AddTargetBone(RFTyre, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopTyre",
                args = {
                    boneIndex = 1,
                    part = 'tyre'
                },
                label = "Chop Tire",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 0.75,
        })
        local LMTyres = {'wheel_lm', 'wheel_lm1'}
        exports['qb-target']:AddTargetBone(LMTyres, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopTyre",
                args = {
                    boneIndex = 2,
                    part = 'tyre'
                },
                label = "Chop Tire",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 0.75,
        })
        local RMTyres = {'wheel_rm', 'wheel_rm1'}
        exports['qb-target']:AddTargetBone(RMTyres, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopTyre",
                args = {
                    boneIndex = 3,
                    part = 'tyre'
                },
                label = "Chop Tire",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 0.75,
        })
        local LRTyre = {'wheel_lr'}
        exports['qb-target']:AddTargetBone(LRTyre, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopTyre",
                args = {
                    boneIndex = 4,
                    part = 'tyre'
                },
                label = "Chop Tire",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 0.75,
        })
        local RRTyre = {'wheel_rr'}
        exports['qb-target']:AddTargetBone(RRTyre, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopTyre",
                args = {
                    boneIndex = 5,
                    part = 'tyre'
                },
                label = "Chop Tire",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 0.75,
        })
        local FDSDoor = {'door_dside_f'}
        exports['qb-target']:AddTargetBone(FDSDoor, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopDoor",
                args = {
                    boneIndex = 0,
                    part = 'door'
                },
                label = "Chop Door",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 1,
        })
        local FPSDoor = {'door_pside_f'}
        exports['qb-target']:AddTargetBone(FPSDoor, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopDoor",
                args = {
                    boneIndex = 1,
                    part = 'door'
                },
                label = "Chop Door",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 1,
        })
        local BDSDoor = {'door_dside_r'}
        exports['qb-target']:AddTargetBone(BDSDoor, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopDoor",
                args = {
                    boneIndex = 2,
                    part = 'door'
                },
                label = "Chop Door",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 1,
        })
        local BPSDoor = {'door_pside_r'}
        exports['qb-target']:AddTargetBone(BPSDoor, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopDoor",
                args = {
                    boneIndex = 3,
                    part = 'door'
                },
                label = "Chop Door",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 1,
        })
        local bonnet = {'bonnet'}
        exports['qb-target']:AddTargetBone(bonnet, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopDoor",
                args = {
                    boneIndex = 4,
                    part = 'bonnet'
                },
                label = "Chop Bonnet",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 1,
        })
        local boot = {'boot'}
        exports['qb-target']:AddTargetBone(boot, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:chopDoor",
                args = {
                    boneIndex = 5,
                    part = 'boot'
                },
                label = "Chop Boot",
                canInteract = function(entity, data)
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local closestVeh = QBCore.Functions.GetClosestVehicle()
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if not HasAssignment then return false end
                    if closestPlate ~= CurVehPlate then return false end
                    return true
                end,
                }  
            },
            distance = 1,
        })
        exports['qb-target']:AddBoxZone('chopShopPed', vector3(Config.MainLocations.list.x, Config.MainLocations.list.y, Config.MainLocations.list.z), 1.0, 1.0, {
            heading = Config.MainLocations.list.w,
            minZ = (Config.MainLocations.list.z - 1),
            maxZ = (Config.MainLocations.list.z + 1),
        }, {
            options = {
                {
                type = "client",
                event = "jcc-chopshop:client:getCarAssignment",
                label = "Ask Jay for a Job.",
                },
            }, 
            distance = 3.0,
        })
end)
Citizen.CreateThread(function()
    local sleep = 100
    local spawnedped = false
    while true do
        sleep = 1000
        local pos = GetEntityCoords(PlayerPedId())
        local inZone = chopShopZone:isPointInside(pos)
        if inZone and not spawnedped then
            spawnedped = true
            RequestModel("cs_joeminuteman")
            Citizen.Wait(100)
            chopShopPed = CreatePed(4, "cs_joeminuteman", Config.MainLocations.list.x, Config.MainLocations.list.y, Config.MainLocations.list.z, Config.MainLocations.list.w, false, false)
            SetEntityInvincible(chopShopPed, true)
            SetBlockingOfNonTemporaryEvents(chopShopPed, true)
            SetEntityAlpha(chopShopPed, 255, false)
            Citizen.Wait(2000)
            FreezeEntityPosition(chopShopPed, true)
            Citizen.Wait(200)
        elseif not inZone and spawnedped then
            spawnedped = false
            DeletePed(chopShopPed)
        end
        if inChopArea and HasAssignment and hasCar and (choppedParts == neededParts) then
            if not IsPedInAnyVehicle(ped, false) then
                local closestVeh = QBCore.Functions.GetClosestVehicle()
                if closestVeh ~= 0 and closestVeh ~= nil then
                    local vehPos = GetEntityCoords(closestVeh)
                    local closestPlate = QBCore.Functions.GetPlate(closestVeh)
                    if #(pos - vector3(vehPos.x, vehPos.y, vehPos.z)) < 2.5 and not isChopping then
                        if closestPlate == CurVehPlate then
                            if not Chopping and not drawTextUp then
                                -- sleep = 1
                                drawTextUp = true
                                SetVehicleEngineHealth(assignedVehicle, 700)
                                exports["qb-drawtext"]:DrawText("[E] - Chop Vehicle", "left")
                                
                            end
                        end
                    else
                        drawTextUp = false
                        exports["qb-drawtext"]:HideText()
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        if drawTextUp == true then
            sleep = 1
            if IsControlJustReleased(0, 38) then
                Chopping = true
                exports['qb-drawtext']:HideText()
                RemoveBlip(DropBlip)
                local data = {
                    part = 'bodyshell'
                }
                TriggerEvent('jcc-chopshop:chopBody', data)
            end
        end
        Citizen.Wait(sleep)
    end
end)
Citizen.CreateThread(function()
    while true do
        sleep = 1000
        if HasAssignment then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            if not zoneSpawned and not zoneDeleted then -- This adds an octogon polyzone around the car, I stayed up way too late figuring this out one night just to realize the next morning I could've made a circle around it but now i kinda like it, it adds character
                zoneSpawned = true
                assignmentZone = PolyZone:Create({
                    vector2((currentLocation.x - 70.71), (currentLocation.y + 70.71)),
                    vector2((currentLocation.x), (currentLocation.y + 100)),
                    vector2((currentLocation.x + 70.71), (currentLocation.y + 70.71)),
                    vector2((currentLocation.x + 100), (currentLocation.y)),
                    vector2((currentLocation.x + 100), (currentLocation.y - 70.71)),
                    vector2((currentLocation.x), (currentLocation.y - 100)),
                    vector2((currentLocation.x - 70.71), (currentLocation.y - 70.71)),
                    vector2((currentLocation.x - 100), (currentLocation.y)),
                }, {
                    name = "assignmentZone",
                    debugPoly = false,
                    minZ = (currentLocation.z - 15),
                    maxZ = (currentLocation.z + 15),
                })
            end
            if zoneSpawned then
                local inZone = assignmentZone:isPointInside(coords)
                if inZone and not vehicleSpawned then   
                    QBCore.Functions.SpawnVehicle(currentCar.type, function(veh)
                        SetVehicleNumberPlateText(veh, CurVehPlate)
                        SetEntityHeading(veh, currentLocation.w)
                        exports['lj-fuel']:SetFuel(veh, 100.0)
                        SetEntityAsMissionEntity(veh, true, true)
                        assignedVehicle = veh
                    end, currentLocation, true)
                    vehicleSpawned = true
                end
                if inZone then
                    local entering = GetVehiclePedIsTryingToEnter(ped)
                    if entering ~= 0 then
                        local plate = QBCore.Functions.GetPlate(entering)
                        if plate == CurVehPlate and not DropBlipMade then
                            RemoveBlip(RadiusBlip)
                            DropBlip = AddBlipForCoord(Config.MainLocations.deliver.x, Config.MainLocations.deliver.y, Config.MainLocations.deliver.z)
                            SetBlipColour(DropBlip, 3)
                            SetBlipRoute(DropBlip, true)
                            SetBlipRouteColour(DropBlip, 3)
                            DropBlipMade = true
                            hasCar = true
                            assignmentZone = nil
                            zoneSpawned = false
                            zoneDeleted = true
                            exports['qb-target']:RemoveZone("assignmentZone")
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)
chopShopArea:onPlayerInOut(function(isPointInside)
    if isPointInside then 
        inChopArea = true
    else
        inChopArea = false
    end
end)
RegisterNetEvent('jcc-chopshop:client:getCarAssignment', function()
    QBCore.Functions.Notify("I\'ll send you an email when I find something for you.")
    zoneDeleted = false
    local timer = 1
    if blackOut then
        blackOut = false
        timer = blackoutTimer
    end
    Wait(timer * math.random(45000, 60000))
    local randomLocation = GetRandomLocation()
    local randomCar = GetRandomCar()
    currentLocation.x = Config.CarLocations[randomLocation].x
    currentLocation.y = Config.CarLocations[randomLocation].y
    currentLocation.z = Config.CarLocations[randomLocation].z
    currentLocation.w = Config.CarLocations[randomLocation].w
    currentCar.name = Config.CarTypes[randomCar].name
    currentCar.type = Config.CarTypes[randomCar].type
    currentCar.parts = Config.CarTypes[randomCar].parts
    neededParts = currentCar.parts
    CurVehPlate = "J"..tostring(math.random(10,99)).."A"..tostring(math.random(10,99)).."YC"
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Jay\'s Automotive Demolition",
        subject = "Assignment",
        message = "I need you to get me a "..currentCar.name..", license plate "..CurVehPlate.." I\'ll give you the last known location when you accept the job.",
        button = {
            enabled = true,
            buttonEvent = "jcc-chopshop:client:setMapMarker"
        }
    })
end)
RegisterNetEvent('jcc-chopshop:client:setMapMarker', function()
    HasAssignment = true
    Citizen.CreateThread(function()
        local xOffset = math.random(1,2)
        local xROffset = math.random(1,125)
        if xOffset == 1 then
            xROffset = (0 - math.random(1,125))
        end
        local yOffset = math.random(1,2)
        local yROffset = math.random(1,125)
        if yOffset == 1 then
            yROffset = (0 - math.random(1,125))
        end
        --This is all some dumb shit to have the blip radius thing be offset randomly and can allow the vehicle to be up to 1 GTA unit from the edge of the blip radius EDIT: I actually don't know if this is true anymore, I've edited it around some after it spawned slightly outside the zone so I'm still tweaking it.
        RadiusBlip = AddBlipForRadius((currentLocation.x + xROffset), (currentLocation.y + yROffset), (currentLocation.z), 200.0)
        SetBlipRotation(RadiusBlip, 0)
        SetBlipColour(RadiusBlip, 30)
        SetBlipAlpha(RadiusBlip, 100)
    end)
end)
RegisterNetEvent('jcc-chopshop:chopTyre', function(data)
    local boneIndex = data.args.boneIndex
    local part = data.args.part
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local inZone = chopShopArea:isPointInside(coords)
    print(assignedVehicle)
    if inZone then 
        local closestVehicle = QBCore.Functions.GetClosestVehicle()
        local closestPlate = QBCore.Functions.GetPlate(closestVehicle)
        if closestPlate == CurVehPlate then
            if IsVehicleTyreBurst(closestVehicle, boneIndex, 1) then return end
            if choppedParts == neededParts then return end --This is to not allow people to do more parts than the vehicle has if they take the vehicle to a bennys or something, working out a way to make it exploit proof but currently thats the main one, but its limited by this a lot
                QBCore.Functions.Progressbar("choptyre", "Chopping tire...", 15000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    anim = "machinic_loop_mechandplayer",
                    animFlag = 17,
                }, {}, {}, function()
                    choppedParts = choppedParts + 1
                    TriggerServerEvent('jcc-chopshop:server:chopVehicle', part)
                    ClearPedTasks(ped)
                    SetVehicleTyreBurst(assignedVehicle, boneIndex, true, 1000.0)
                end, function()
                    ClearPedTasks(ped)
                    QBCore.Functions.Notify("Canceled", "error")
                end)
        end
    end
end)
RegisterNetEvent('jcc-chopshop:chopDoor', function(data)
    local boneIndex = data.args.boneIndex
    local part = data.args.part
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local inZone = chopShopArea:isPointInside(coords)
    if inZone then 
        local closestVehicle = QBCore.Functions.GetClosestVehicle()
        local closestPlate = QBCore.Functions.GetPlate(closestVehicle)
        if closestPlate == CurVehPlate then
            -- if IsVehicleDoorDamaged(closestVehId, boneIndex) then return end
            if choppedParts == neededParts then return end -- Because I cant figure out a really good way to damage vehicle and make it undriveable after you start chopping it without it blowing up eventually, so if they chop, drive repair, and try to chop the same part again they wont be able to, max parts per vehicle detailed in config
                SetVehicleDoorOpen(closestVehicle, boneIndex, 0, 1)
                QBCore.Functions.Progressbar("chopdoor", "Chopping...", 15000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@world_human_welding@male@base",
                    anim = "base",
                }, {
                    model = "prop_weld_torch",
                    bone = 28422,
                    coords = {
                        x = 0.0,
                        y = 0.0,
                        z = 0.0
                    },
                    rotation = {
                        x = 0.0,
                        y = 0.0,
                        z = 0.0
                    }
                }, {}, function()
                    choppedParts = choppedParts + 1
                    TriggerServerEvent('jcc-chopshop:server:chopVehicle', part)
                    ClearPedTasks(ped)
                    SetVehicleDoorBroken(assignedVehicle, boneIndex, 1)
                    -- SetVehicleEngineHealth(closestVehicle, 500)
                    if boneIndex == 4 then 
                        SmashVehicleWindow(assignedVehicle, 6)
                    elseif boneIndex == 5 then
                        SmashVehicleWindow(assignedVehicle, 7)
                    end
                end, function()
                    ClearPedTasks(ped)
                    QBCore.Functions.Notify("Canceled", "error")
                end)
        end
    end
end)
RegisterNetEvent('jcc-chopshop:chopBody', function(data)
    -- local boneIndex = data.args.boneIndex
    local part = data.part
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local inZone = chopShopArea:isPointInside(coords)
    if inZone then 
        local closestVehicle = QBCore.Functions.GetClosestVehicle()
        local boneIndex = GetEntityBoneIndexByName(closestVehicle, "bodyshell")
        local closestPlate = QBCore.Functions.GetPlate(closestVehicle)
        if closestPlate == CurVehPlate then
                QBCore.Functions.Progressbar("chopdoor", "Chopping...", 15000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@world_human_welding@male@base",
                    anim = "base",
                }, {
                    model = "prop_weld_torch",
                    bone = 28422,
                    coords = {
                        x = 0.0,
                        y = 0.0,
                        z = 0.0
                    },
                    rotation = {
                        x = 0.0,
                        y = 0.0,
                        z = 0.0
                    }
                }, {}, function()
                    lastLocation = currentLocation
                    lastCar = currentCar
                    currentLocation = {}
                    currentCar = {}
                    neededParts = 8
                    choppedParts = 0
                    choppedCar = false
                    HasAssignment = false
                    Chopping = false
                    drawTextUp = false
                    blackoutTimer = (blackoutTimer + math.random(3,6))
                    TriggerServerEvent('jcc-chopshop:server:chopVehicle', part)
                    ClearPedTasks(ped)
                    QBCore.Functions.DeleteVehicle(assignedVehicle)
                end, function()
                    Chopping = false
                    drawTextUp = false
                    ClearPedTasks(ped)
                    QBCore.Functions.Notify("Canceled", "error")
                end)
        end
    end
end)
function GetRandomLocation()
    local randomPickupLocation = math.random(1, #Config.CarLocations)
    while (randomPickupLocation == lastLocation) do
        Citizen.Wait(10)
        randomPickupLocation = math.random(1, #Config.CarLocations)
    end
    return randomPickupLocation
end
function GetRandomCar()
    local randomPickupCar = math.random(1, #Config.CarTypes)
    while (randomPickupCar == lastCar) do
        Citizen.Wait(10)
        randomPickupCar = math.random(1, #Config.CarTypes)
    end
    return randomPickupCar
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        while blackOut do
            if blackoutTimer > 1 then
                blackOut = false
            else
                blackoutTimer = (blackoutTimer - 1)
            end
            Wait(59990)
        end
    end
end)