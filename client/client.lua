local VORPcore = exports.vorp_core:GetCore()
local BccUtils = exports['bcc-utils'].initiate()
local MiniGame = exports['bcc-minigames'].initiate()

local MissionActive = false
local digging = true
local shovelObject = nil
local spawnedtruhe = false
local schatztruhe = nil
local Trys = 0
local deg1 = 0
local deg2 = 0
local deg3 = 0
local schatztruhecoords = nil
local DiggingComplete = false
local LockpickComplete = false
local MissionBlipActive = false

RegisterNetEvent('mms-treasure:client:starttreasure')
AddEventHandler('mms-treasure:client:starttreasure',function()
    local randomselect = math.random(1,#Config.TreasureMissions)
    local selected = Config.TreasureMissions[randomselect]
    if MissionActive == false then
        MissionActive = true
        Wait(10)
        TriggerEvent('mms-treasure:client:missionstart',selected)
        VORPcore.NotifyTip(_U('MissionStarted'),  5000)
    else
        TriggerServerEvent('mms-treasure:server:givebackmap')
        VORPcore.NotifyTip(_U('AlreadyActiveMission'), 5000)
    end
end)

RegisterNetEvent('mms-treasure:client:missionstart')
AddEventHandler('mms-treasure:client:missionstart',function(selected)
    BlipCoords = selected.locationblip
    BlipSprite = selected.blipsprite
    Mission = selected.Mission
    MissionBlip = BccUtils.Blips:SetBlip(_U('MissionBlipName'), BlipSprite, 0.2, BlipCoords.x,BlipCoords.y,BlipCoords.z)
    MissionBlipActive = true
    TreasurePrompt = BccUtils.Prompts:SetupPromptGroup()
    treasureprompt = TreasurePrompt:RegisterPrompt(_U('PromptName'), 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    -- Create GPS
    StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
    AddPointToGpsMultiRoute(BlipCoords)
    SetGpsMultiRouteRender(true)
    while MissionActive do
        Wait(1)
        for h,v in pairs(Mission) do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - v.coords)
        if dist < 1.5 then
            TreasurePrompt:ShowGroup(_U('PromptName'))

            if treasureprompt:HasCompleted() then
                if Trys < Config.MaxTrys then
                    TriggerEvent('mms-treasure:client:startdigging')
                    Trys = Trys + 1
                else
                    VORPcore.NotifyTip(_U('NoMoreTrys'), 5000)
                    AbortMission()
                end
            end
        end
    end
    end
end)

RegisterNetEvent('mms-treasure:client:startdigging')
AddEventHandler('mms-treasure:client:startdigging',function()
    local cbresult =  VORPcore.Callback.TriggerAwait('mms-treasure:callback:checkforshovel')
    if cbresult then
        if shovelObject then
            DeleteObject(shovelObject)
            SetEntityAsNoLongerNeeded(shovelObject)
            shovelObject = nil
        end
        digging = true
        local pedp = PlayerPedId()
        local pc = GetEntityCoords(pedp)
        local model = Config.Dig.shovel
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end
        shovelObject = CreateObject(model, pc.x, pc.y, pc.z, true, true, true)
        local boneIndex = GetEntityBoneIndexByName(pedp, Config.Dig.bone)
        local Attach = Config.Dig.pos
        local anim = Config.Dig.anim
        RequestAnimDict(anim[1])
        while not HasAnimDictLoaded(anim[1]) do
            Citizen.Wait(0)
        end
        TaskPlayAnim(pedp, anim[1], anim[2], 1.0, 1.0, -1, 1, 0, false, false, false)
        AttachEnt(shovelObject, pedp, boneIndex, Attach[1], Attach[2], Attach[3], Attach[4], Attach[5], Attach[6], 0, 1, 1, 1)
        TriggerServerEvent('mms-treasure:server:ToolUsage')
        TriggerEvent('mms-treasure:client:diggingtimer')
        Citizen.Wait(200)
        RemoveAnimDict(anim[1])
        SetModelAsNoLongerNeeded(model)
    else
        VORPcore.NotifyTip(_U('NoDigItem'), 5000)
    end

end)

RegisterNetEvent('mms-treasure:client:diggingtimer')
AddEventHandler('mms-treasure:client:diggingtimer', function()
    local timer = Config.DiggingTimer
    local timer2 = 0
    while timer2 ~= timer and digging do
        Citizen.Wait(1000)
        timer2 = timer2 + 1
        if not digging then
            break
        end
    end
    if digging then
        EndShovel()
        TriggerEvent('mms-treasure:client:spawnchest')
    end
end)

RegisterNetEvent('mms-treasure:client:spawnchest')
AddEventHandler('mms-treasure:client:spawnchest', function()
    local chance = math.random(1,7)
    local playerpos = GetEntityCoords(PlayerPedId())
    local playerheading = GetEntityHeading(PlayerPedId())
    if chance == 2 or chance == 5 then
        DiggingComplete = true
    local hash = GetHashKey('s_re_rcboatbox01x')
        while not HasModelLoaded(hash) do
            Wait(10)
            RequestModel(hash)
        end
        if  spawnedtruhe == false then
            RequestModel(hash)
            schatztruhe = CreateObject(hash, playerpos.x,playerpos.y,playerpos.z  , true, false, false) 
            SetEntityHeading(schatztruhe,playerheading)
            SetEntityAsMissionEntity(schatztruhe, true,true)
            PlaceObjectOnGroundProperly(schatztruhe)
            FreezeEntityPosition(schatztruhe, true)
            spawnedtruhe = true
            schatztruhecoords = GetEntityCoords(schatztruhe)
        end
        treasureprompt:TogglePrompt(false)
        TriggerEvent('mms-treasure:client:lockpicktruhe',schatztruhecoords)
    else
        VORPcore.NotifyTip(_U('NoLuck'), 5000)
    end
end)

RegisterNetEvent('mms-treasure:client:lockpicktruhe')
AddEventHandler('mms-treasure:client:lockpicktruhe', function(schatztruhecoords)
    if Config.ChestNeedPick == true then
    local TruheGroupPrompt = BccUtils.Prompts:SetupPromptGroup()
    truheprompt = TruheGroupPrompt:RegisterPrompt(_U('TruhePromptName'), 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    deg1 = math.random(1,360)
    deg2 = math.random(1,360)
    deg3 = math.random(1,360)
    local lockpicksettings = {
        focus = true, -- Should minigame take nui focus
        cursor = true, -- Should minigame have cursor  (required for lockpick)
        maxattempts = 1, -- How many fail attempts are allowed before game over
        threshold = 10, -- +- threshold to the stage degree (bigger number means easier)
        hintdelay = 500, --milliseconds delay on when the circle will shake to show lockpick is in the right position.
        stages = {{deg = deg1},{deg = deg2},{deg = deg3}}
    }
    while spawnedtruhe == true do
        Wait(1)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - schatztruhecoords)
        if distance < 6 then
            TruheGroupPrompt:ShowGroup(_U('TruhePromptName'))
            if truheprompt:HasCompleted() then
                local lockpickresult =  VORPcore.Callback.TriggerAwait('mms-treasure:callback:checkforlockpick')
                if lockpickresult == true then 
                    MiniGame.Start('lockpick', lockpicksettings, function(result)
                        if result.unlocked == true then
                            LockpickComplete = true
                            truheprompt:TogglePrompt(false)
                            if MissionActive == true and DiggingComplete == true and LockpickComplete == true then
                            TriggerServerEvent('mms-treasure:server:rws')
                            AbortMission()
                            end
                        else
                            VORPcore.NotifyTip(_U('LockpickingFailed'), 5000)
                        end
                    end)
                else
                    VORPcore.NotifyTip(_U('MissingLockpick'),  5000)
            end
        end
        
    end
end
else
    local TruheGroupPrompt = BccUtils.Prompts:SetupPromptGroup()
    truheprompt = TruheGroupPrompt:RegisterPrompt(_U('TruhePromptName2'), 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'MEDIUM_TIMED_EVENT'})
    while spawnedtruhe == true do
        Wait(1)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - schatztruhecoords)
        if distance < 6 then
            TruheGroupPrompt:ShowGroup(_U('TruhePromptName2'))
            if truheprompt:HasCompleted() then
                TriggerServerEvent('mms-treasure:server:rws')
                AbortMission()
            end
    end
end
end
end)

---- UTILS

function AttachEnt(from, to, boneIndex, x, y, z, pitch, roll, yaw, useSoftPinning, collision, vertex, fixedRot)
    return AttachEntityToEntity(from, to, boneIndex, x, y, z, pitch, roll, yaw, false, useSoftPinning, collision, false,
        vertex, fixedRot, false, false)
end

function EndShovel()
    digging = false
    if shovelObject then
        DeleteObject(shovelObject)
        SetEntityAsNoLongerNeeded(shovelObject)
        shovelObject = nil
    end
    ClearPedTasks(PlayerPedId())
end


function AbortMission()
    MissionActive = false
    DiggingComplete = false 
    LockpickComplete = false
    MissionBlip:Remove()
    ClearGpsMultiRoute()
    if spawnedtruhe == true then
        DeleteObject(schatztruhe)
        spawnedtruhe = false
    end
    Trys = 0
    treasureprompt:TogglePrompt(false)
end

RegisterNetEvent('onResourceStop',function(resource)
    if resource == GetCurrentResourceName() then
    MissionActive = false
    DiggingComplete = false 
    LockpickComplete = false
    if MissionBlipActive == true then
    MissionBlip:Remove()
    end
    if spawnedtruhe == true then
        DeleteObject(schatztruhe)
        spawnedtruhe = false
    end
    Trys = 0
end
end)