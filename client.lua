local albreadyDead      = false
local TimerDied         = 3500
local CooldownTimer     = 9500 + TimerDied

Citizen.CreateThread(function()
    _InfinitySource        = GetPlayerServerId(PlayerId())
    while true do 
        local current_district, town, latest, docPos, anim = CurrentDistrict()
        if current_district ~= false and town ~= false and not ShowTown or latest ~= town then 
            ShowTown = true
            exports.infinity_core:notification(_InfinitySource, '<h5 class="text-light m-0">'..town..'</h5>', '', 'top_center', 'town', 3500)
        elseif current_district == false then
            ShowTown = false
        end
        if GetPlayerHP() <= 0 then 
            if not albreadyDead then 
                STOP_SPAWN  = false
                AnimpostfxPlay("DeathFailMP01")
                LaunchCoolDown(town, docPos, anim)
            end
        elseif GetPlayerHP() >= 1 then 
            STOP_SPAWN = true
        end
        Citizen.Wait(TimerDied)
    end
end)

function GetPlayerHP()
    PlayerHealth = GetEntityHealth(PlayerPedId())
    return PlayerHealth
end

function CurrentDistrict()
    local x,y,z             = table.unpack(GetEntityCoords(PlayerPedId()))
    local ZoneTypeId        = 1
    local current_district  = Citizen.InvokeNative(0x43AD8FC02B429D33 ,x,y,z,ZoneTypeId)

    if current_district == 459833523 then
        town             = "VALENTINES"
        docPos           = {x = -289.52, y = 810.6, z = 119.39 -1, h = 300.71}
        anim             = false
    elseif current_district == 1053078005 then
        town             = "BLACKWATER"
        docPos           = {x = -764.23, y = -1327.49, z = 47.11 -1, h = 253.62}
        anim             = false
    elseif current_district == 427683330 then
        town             = "STRAWBERRY"
        docPos           = {x = -1803.15, y = -432.66, z = 158.82 -1, h = 26.49}
        anim             = false
    elseif current_district == -765540529 then
        town             = "SAINT-DENIS"
        docPos           = {x = 2733.51, y = -1231.57, z = 50.37 -1, h = 317.86}
        anim             = false
    elseif current_district == 7359335 then
        town             = "ANNESBURG"
        docPos           = {x = 2984.25, y = 1298.95, z = 41.32 -1, h = 190.51}
        anim             = true
    elseif current_district == -744494798 then
        town             = "ARMADILLO"
        docPos           = {x = -3583.2, y = -2608.18, z = -15.29 -1, h = 108.53}
        anim             = true
    elseif current_district == 2046780049 then
        town             = "RHODES"
        docPos           = {x = 1369.29, y = -1311.18, z = 77.94 -1, h = 142.39}
        anim             = false
    elseif current_district == 2126321341 then
        town             = "VANHORN"
        docPos           = {x = 2987.78, y = 505.28, z = 41.76 -1, h = 47.33}
        anim             = true
    elseif current_district == -1524959147 then
        town             = "TUMBLEWEED"
        docPos           = {x = -5443.77, y = -2905.4, z = 0.93 -1, h = 318.9}
        anim             = true
    elseif current_district == false or current_district ~= nil then 
        town             = false
        docPos           = {x = -289.52, y = 810.6, z = 119.39 -1, h = 300.71}
        anim             = false
    end
    latest = town
    return current_district, town, latest, docPos, anim
end

function LaunchCoolDown(town, docPos, anim)
    if town == false then 
        town = "Valentines"
    end
    albreadyDead = true
    MessageDead(STOP_SPAWN, town)
    Citizen.SetTimeout(CooldownTimer, function()
        albreadyDead    = false
        local playerPed = PlayerPedId()
        ResurrectPed(PlayerPedId(playerPed))
        Citizen.InvokeNative(0x50C803A4CD5932C5, true)
        health      = GetEntityHealth(PlayerPedId(playerPed))
        if health ~= nil then
            if health > 100 then
                local new    = health - 100
                local remove = health - new
                SetEntityHealth(PlayerPedId(), remove)
            elseif health <= 100 then
                SetEntityHealth(PlayerPedId(), health)
            end
        end
        Death = false
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 100)
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 100)
        MessageDead(STOP_SPAWN, town)
        if not STOP_SPAWN then
            SetEntityCoords(playerPed, docPos.x, docPos.y, docPos.z)
            SetEntityHeading(playerPed, docPos.h)
        end
        AnimpostfxStop("DeathFailMP01")
        if not STOP_SPAWN then

            local PlayerDatas = exports.infinity_core:GetPlayerSession(_InfinitySource)
            if PlayerDatas._Rank ~= "vip" and PlayerDatas._Cash >= 5 then
                TriggerServerEvent('infinity_respawn:loseMoney', _InfinitySource, 25, 5)
            end
            AnimpostfxPlay("PlayerHealthPoor")
            if anim then 
                TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_RE_LOST_DRUNK_SLEEP'), 1500)
            end
            exports.infinity_core:notification(_InfinitySource, '<h5 class="text-light m-0">Welcome back</h5>', '', 'bottom_large', 'redmin', 2500)
            Wait(3500)
            AnimpostfxStop("PlayerHealthPoor")
        end
    end)
end

function MessageDead(STOP_SPAWN, town)
    if STOP_SPAWN == false then 
        exports.infinity_core:notification(_InfinitySource, '<h1 class="text-danger">DEAD</h1>', '<small style="font-size:18px;">You are dead</small> <br> Respawn in few seconds in '..town..'', 'bottom_large', 'redmin', CooldownTimer)
    else
        exports.infinity_core:notification(_InfinitySource, '', '', 'bottom_large', 'redm', 1)
    end
end