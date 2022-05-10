local QBCore = exports['qb-core']:GetCoreObject()
local inChopArea = false
local RadiusBlip = nil
local chopShopZone = CircleZone:Create(vector2(Config.MainLocations.dropoff.x, Config.MainLocations.dropoff.y), 100, {
    name="chopShopZone",
    debugPoly = false,
    minZ = 25.0,
    maxZ = 35.0
})
chopShopZone:onPlayerInOut(function(isPointInside)
    if isPointInside then 
        inChopArea = true
    else
        inChopArea = false
    end
end)
RegisterNetEvent('chopshop:attemptGroupStart', function()
    if exports["ps-playergroups"]:IsGroupLeader() then 
        if exports["ps-playergroups"]:GetJobStage() == "WAITING" then
            local groupID = exports["ps-playergroups"]:GetGroupID()
            TriggerServerEvent('chopshop:createChopGroup', groupID)
        end
    end
end)
RegisterNetEvent('chopshop:attemptGroupQueueToggle', function()
    if exports["ps-playergroups"]:IsGroupLeader() then 
        if exports["ps-playergroups"]:GetJobStage() == "CHOP SHOP" then
            local groupID = exports["ps-playergroups"]:GetGroupID()
            TriggerServerEvent('chopshop:joinQueue', groupID)
        end
    end
end)
RegisterNetEvent('chopshop:sendGroupTargets', function(vehhicleID)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleID)
    local LFTyre = {'wheel_lf'}
    exports['qb-target']:AddTargetBone(LFTyre, {
        options = {
            {
            type = "client",
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 0,
                part = 'tyre',
                vehID = vehicleID,
            },
            label = "Chop Tire",
            canInteract = function(entity)
                if entity ~= vehicle then return false end
                if IsVehicleTyreBurst(vehicle, 0, true) then return false end
                if not inChopArea then return false end
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 1,
                part = 'tyre',
                vehID = vehicleID,
            },
            label = "Chop Tire",
            canInteract = function(entity)
                if entity ~= vehicle then return false end
                if IsVehicleTyreBurst(vehicle, 1, true) then return false end
                if not inChopArea then return false end
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 2,
                part = 'tyre',
                vehID = vehicleID,
            },
            label = "Chop Tire",
            canInteract = function(entity)
                if entity ~= vehicle then return false end
                if IsVehicleTyreBurst(vehicle, 2, true) then return false end
                if not inChopArea then return false end
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 3,
                part = 'tyre',
                vehID = vehicleID,
            },
            label = "Chop Tire",
            canInteract = function(entity)
                if entity ~= vehicle then return false end
                if IsVehicleTyreBurst(vehicle, 3, true) then return false end
                if not inChopArea then return false end
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 4,
                part = 'tyre',
                vehID = vehicleID,
            },
            label = "Chop Tire",
            canInteract = function(entity)
                if entity ~= vehicle then return false end
                if IsVehicleTyreBurst(vehicle, 4, true) then return false end
                if not inChopArea then return false end
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 5,
                part = 'tyre',
                vehID = vehicleID,
            },
            label = "Chop Tire",
            canInteract = function(entity)
                if entity ~= vehicle then return false end
                if IsVehicleTyreBurst(vehicle, 5, true) then return false end
                if not inChopArea then return false end
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 0,
                part = 'door',
                vehID = vehicleID,
            },
            label = "Chop Door",
            canInteract = function(entity)
                if entity == vehicle then return true end
                if not inChopArea then return false end
                return false
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 1,
                part = 'door',
                vehID = vehicleID,
            },
            label = "Chop Door",
            canInteract = function(entity)
                if entity == vehicle then return true end
                if not inChopArea then return false end
                return false
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 2,
                part = 'door',
                vehID = vehicleID,
            },
            label = "Chop Door",
            canInteract = function(entity)
                if entity == vehicle then return true end
                if not inChopArea then return false end
                return false
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 3,
                part = 'door',
                vehID = vehicleID,
            },
            label = "Chop Door",
            canInteract = function(entity)
                if entity == vehicle then return true end
                if not inChopArea then return false end
                return false
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 4,
                part = 'bonnet',
                vehID = vehicleID,
            },
            label = "Chop Bonnet",
            canInteract = function(entity)
                if entity == vehicle then return true end
                if not inChopArea then return false end
                return false
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
            event = "chopshop:client:chopPart",
            args = {
                boneIndex = 5,
                part = 'boot',
                vehID = vehicleID,  
            },
            label = "Chop Boot",
            canInteract = function(entity)
                if entity == vehicle then return true end
                if not inChopArea then return false end
                return false
            end,
            }  
        },
        distance = 1,
    })
end)
RegisterNetEvent('chopshop:removeGroupTargets', function()
    local tires = {
        'wheel_lf',
        'wheel_rf',
        'wheel_lm',
        'wheel_lm1',
        'wheel_rm',
        'wheel_rm1',
        'wheel_lr',
        'wheel_rr'
    }
    local doors = {
        'door_dside_f',
        'door_pside_f',
        'door_dside_r',
        'door_pside_r',
    }
    exports['qb-target']:RemoveTargetBone(tires, 'Chop Tire')
    exports['qb-target']:RemoveTargetBone(doords, 'Chop Door')
    exports['qb-target']:RemoveTargetBone('bonnet', 'Chop Bonnet')
    exports['qb-target']:RemoveTargetBone('boot', 'Chop Boot')
end)
RegisterNetEvent('chopshop:client:chopPart', function(data)
    local boneIndex = data.args.boneIndex
    local part = data.args.part
    local vehID = data.args.vehID
    local ped = PlayerPedId()
    local groupID = exports["ps-playergroups"]:GetGroupID()
    if inChopArea then
        local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
        local anim = "machinic_loop_mechandplayer"
        local animFlag = 17
        if part ~= 'tyre' then
            animDict = "amb@world_human_welding@male@base"
            anim = "base"
            model = "prop_weld_torch"
            animFlag = 0
            local bone = 28422
        end
        QBCore.Functions.Progressbar("choppart", "Chopping part...", 15000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = animDict,
            anim = anim,
            animFlag = animFlag or nil
        }, {
            model = model or nil,
            bone = bone or nil,     
        }, {}, function()
            TriggerServerEvent('chopshop:chopPart', groupID, part, boneIndex)
            ClearPedTasks(ped)
        end, function()
            ClearPedTasks(ped)
            QBCore.Functions.Notify("Canceled", "error")
        end)
    end
end)
RegisterNetEvent('chopshop:client:finishVehicle', function()
    local groupID = exports["ps-playergroups"]:GetGroupID()
    local animDict = "amb@world_human_welding@male@base"
    local anim = "base"
    local model = "prop_weld_torch"
    local bone = 28422
    QBCore.Functions.Progressbar("choppart", "Chopping Car...", 15000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = animDict,
        anim = anim,
    }, {
        model = model or nil,
        bone = bone or nil,     
    }, {}, function()
        TriggerServerEvent('chopshop:finishVehicle', groupID)
        ClearPedTasks(ped)
    end, function()
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end) 
RegisterNetEvent('chopshop:createVehicleBlip', function(blipData, pickup)
    RadiusBlip = AddBlipForRadius(blipData.x, blipData.y, blipData.z, 200.0)
    SetBlipRotation(RadiusBlip, 0)
    SetBlipColour(RadiusBlip, 30)
    SetBlipAlpha(RadiusBlip, 100)
end)
RegisterNetEvent('chopshop:cleanUp', function()
    TriggerEvent('chopshop:removeGroupTargets')
    RemoveBlip(RadiusBlip)
end)

Citizen.CreateThread(function()
	CreatePeds()
end)
local peds = {}
local shopPeds = {}
function CreatePeds()
	while true do
		Citizen.Wait(500)
		for k = 1, #Config.PedList, 1 do
			v = Config.PedList[k]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)
			if dist < Config.Distance and not peds[k] then
				local ped = nearPed(v.model, v.coords, v.heading, v.gender, v.animDict, v.animName, v.scenario)
				peds[k] = {ped = ped}
			end
			if dist >= Config.Distance and peds[k] then
				if Config.Fade then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(peds[k].ped, i, false)
					end
				end
				DeletePed(peds[k].ped)
				peds[k] = nil
			end
		end
	end
end
function nearPed(model, coords, heading, gender, animDict, animName, scenario)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(1)
	end
	if gender == 'male' then
		genderNum = 4
	elseif gender == 'female' then 
		genderNum = 5
	else
		print("No gender provided! Check your configuration!")
	end
	if Config.MinusOne then 
		local x, y, z = table.unpack(coords)
		ped = CreatePed(genderNum, GetHashKey(model), x, y, z - 1, heading, false, true)
		table.insert(shopPeds, ped)
	else
		ped = CreatePed(genderNum, GetHashKey(v.model), coords, heading, false, true)
		table.insert(shopPeds, ped)
	end
	SetEntityAlpha(ped, 0, false)
	if Config.Frozen then
		FreezeEntityPosition(ped, true)
	end
	if Config.Invincible then
		SetEntityInvincible(ped, true)
	end
	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(ped, true)
	end
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(1)
		end
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
	if scenario then
		TaskStartScenarioInPlace(ped, scenario, 0, true)
	end
	if Config.Fade then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(ped, i, false)
		end
	end
	return ped
end
CreateThread(function()
    exports['qb-target']:AddBoxZone("chopshopped", Config.PedList[1].coords, 1, 1, {
        name="chopshopped",
        heading=Config.PedList[1].heading,
        debugPoly=false,
        minZ=Config.PedList[1].minZ,
        maxZ=Config.PedList[1].maxZ,
    }, {
        options = {
            {
                type = "client",
                event = "chopshop:attemptGroupStart",
                label = "Sign up for Chop Shop",
            },
            {
                type = "client",
                event = "chopshop:attemptGroupQueueToggle",
                label = "Join/Leave Chop Queue"
            }
        },
        distance = 2.5
    })
end)