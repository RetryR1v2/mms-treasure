local VORPcore = exports.vorp_core:GetCore()


-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-treasure/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

--- Register Usable Item Trasure Map


exports.vorp_inventory:registerUsableItem(Config.TrasureMapItem, function(data)
    local source = data.source
    TriggerClientEvent('mms-treasure:client:starttreasure',source)
    exports.vorp_inventory:subItem(source, Config.TrasureMapItem, 1, nil, nil)
end)

---- Callback Check for Shovel

VORPcore.Callback.Register('mms-treasure:callback:checkforshovel', function(source,cb)
    local src = source
    local hasitem = exports.vorp_inventory:getItemByName(src, Config.DigItem, nil)
    if hasitem ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

---- Callback Check for Lockpick

VORPcore.Callback.Register('mms-treasure:callback:checkforlockpick', function(source,cb)
local src = source
    local itemCount = exports.vorp_inventory:getItemCount(src, nil, Config.LockpickItem,nil)
        if itemCount > 0 then
            exports.vorp_inventory:subItem(src, Config.LockpickItem, 1)
            cb(true)
        else
            cb(false)
        end
end)
---- Giveback Map

RegisterServerEvent('mms-treasure:server:givebackmap',function ()
    local src = source
    exports.vorp_inventory:addItem(src, Config.TrasureMapItem, 1, nil,nil)
end)

RegisterServerEvent('mms-treasure:server:rws',function ()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    if Config.OnlyMoney == true and Config.OnlyItems == false then
        -- money
        local Rewardcash = math.random(Config.RewardCashMin,Config.RewardCashMax)
        Character.addCurrency(0, Rewardcash)
        VORPcore.NotifyTip(src, _U('RewardMoney') .. Rewardcash .. ' $',  5000)
    elseif Config.OnlyMoney == false and Config.OnlyItems == true then
        local randomitem = math.random(1,#Config.RewardItems)
        local rewarditem = Config.RewardItems[randomitem].item
        local rewardamount = Config.RewardItems[randomitem].amount
        exports.vorp_inventory:addItem(src, rewarditem, rewardamount, nil,nil)
        VORPcore.NotifyTip(src, _U('RewardItem') .. rewardamount .. ' ' .. rewarditem,  5000)
    elseif Config.OnlyMoney == false and Config.OnlyItems == false then
        local itemormoney = math.random(1,2)
            if itemormoney == 1 then
            -- Item
                local randomitem = math.random(1,#Config.RewardItems)
                local rewarditem = Config.RewardItems[randomitem].item
                local rewardamount = Config.RewardItems[randomitem].amount
                exports.vorp_inventory:addItem(src, rewarditem, rewardamount, nil,nil)
                VORPcore.NotifyTip(src, _U('RewardItem') .. rewardamount .. ' ' .. rewarditem,  5000)
            elseif itemormoney == 2 then
            -- money
                local Rewardcash = math.random(Config.RewardCashMin,Config.RewardCashMax)
                Character.addCurrency(0, Rewardcash)
                VORPcore.NotifyTip(src, _U('RewardMoney') .. Rewardcash .. ' $',  5000)
            end
    end
end)


--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()